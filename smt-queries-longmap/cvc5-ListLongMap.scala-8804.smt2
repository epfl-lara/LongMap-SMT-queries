; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107048 () Bool)

(assert start!107048)

(declare-fun b_free!27553 () Bool)

(declare-fun b_next!27553 () Bool)

(assert (=> start!107048 (= b_free!27553 (not b_next!27553))))

(declare-fun tp!96885 () Bool)

(declare-fun b_and!45585 () Bool)

(assert (=> start!107048 (= tp!96885 b_and!45585)))

(declare-fun b!1269171 () Bool)

(declare-fun res!844640 () Bool)

(declare-fun e!723359 () Bool)

(assert (=> b!1269171 (=> (not res!844640) (not e!723359))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82738 0))(
  ( (array!82739 (arr!39906 (Array (_ BitVec 32) (_ BitVec 64))) (size!40442 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82738)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((V!48843 0))(
  ( (V!48844 (val!16443 Int)) )
))
(declare-datatypes ((ValueCell!15515 0))(
  ( (ValueCellFull!15515 (v!19080 V!48843)) (EmptyCell!15515) )
))
(declare-datatypes ((array!82740 0))(
  ( (array!82741 (arr!39907 (Array (_ BitVec 32) ValueCell!15515)) (size!40443 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82740)

(assert (=> b!1269171 (= res!844640 (and (= (size!40443 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40442 _keys!1364) (size!40443 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844639 () Bool)

(assert (=> start!107048 (=> (not res!844639) (not e!723359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107048 (= res!844639 (validMask!0 mask!1730))))

(assert (=> start!107048 e!723359))

(declare-fun e!723363 () Bool)

(declare-fun array_inv!30361 (array!82740) Bool)

(assert (=> start!107048 (and (array_inv!30361 _values!1134) e!723363)))

(assert (=> start!107048 true))

(declare-fun array_inv!30362 (array!82738) Bool)

(assert (=> start!107048 (array_inv!30362 _keys!1364)))

(declare-fun tp_is_empty!32737 () Bool)

(assert (=> start!107048 tp_is_empty!32737))

(assert (=> start!107048 tp!96885))

(declare-fun b!1269172 () Bool)

(declare-fun res!844636 () Bool)

(assert (=> b!1269172 (=> (not res!844636) (not e!723359))))

(declare-datatypes ((List!28413 0))(
  ( (Nil!28410) (Cons!28409 (h!29618 (_ BitVec 64)) (t!41942 List!28413)) )
))
(declare-fun arrayNoDuplicates!0 (array!82738 (_ BitVec 32) List!28413) Bool)

(assert (=> b!1269172 (= res!844636 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28410))))

(declare-fun b!1269173 () Bool)

(declare-fun res!844637 () Bool)

(assert (=> b!1269173 (=> (not res!844637) (not e!723359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82738 (_ BitVec 32)) Bool)

(assert (=> b!1269173 (= res!844637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269174 () Bool)

(declare-fun e!723362 () Bool)

(assert (=> b!1269174 (= e!723362 tp_is_empty!32737)))

(declare-fun b!1269175 () Bool)

(declare-fun e!723360 () Bool)

(declare-fun mapRes!50686 () Bool)

(assert (=> b!1269175 (= e!723363 (and e!723360 mapRes!50686))))

(declare-fun condMapEmpty!50686 () Bool)

(declare-fun mapDefault!50686 () ValueCell!15515)

