; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107010 () Bool)

(assert start!107010)

(declare-fun b!1268789 () Bool)

(declare-fun e!723074 () Bool)

(declare-fun tp_is_empty!32699 () Bool)

(assert (=> b!1268789 (= e!723074 tp_is_empty!32699)))

(declare-fun b!1268790 () Bool)

(declare-fun e!723078 () Bool)

(assert (=> b!1268790 (= e!723078 tp_is_empty!32699)))

(declare-fun res!844426 () Bool)

(declare-fun e!723075 () Bool)

(assert (=> start!107010 (=> (not res!844426) (not e!723075))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107010 (= res!844426 (validMask!0 mask!1730))))

(assert (=> start!107010 e!723075))

(declare-datatypes ((V!48791 0))(
  ( (V!48792 (val!16424 Int)) )
))
(declare-datatypes ((ValueCell!15496 0))(
  ( (ValueCellFull!15496 (v!19061 V!48791)) (EmptyCell!15496) )
))
(declare-datatypes ((array!82668 0))(
  ( (array!82669 (arr!39871 (Array (_ BitVec 32) ValueCell!15496)) (size!40407 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82668)

(declare-fun e!723077 () Bool)

(declare-fun array_inv!30337 (array!82668) Bool)

(assert (=> start!107010 (and (array_inv!30337 _values!1134) e!723077)))

(assert (=> start!107010 true))

(declare-datatypes ((array!82670 0))(
  ( (array!82671 (arr!39872 (Array (_ BitVec 32) (_ BitVec 64))) (size!40408 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82670)

(declare-fun array_inv!30338 (array!82670) Bool)

(assert (=> start!107010 (array_inv!30338 _keys!1364)))

(declare-fun b!1268791 () Bool)

(declare-fun res!844427 () Bool)

(assert (=> b!1268791 (=> (not res!844427) (not e!723075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82670 (_ BitVec 32)) Bool)

(assert (=> b!1268791 (= res!844427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50629 () Bool)

(declare-fun mapRes!50629 () Bool)

(declare-fun tp!96808 () Bool)

(assert (=> mapNonEmpty!50629 (= mapRes!50629 (and tp!96808 e!723074))))

(declare-fun mapValue!50629 () ValueCell!15496)

(declare-fun mapKey!50629 () (_ BitVec 32))

(declare-fun mapRest!50629 () (Array (_ BitVec 32) ValueCell!15496))

(assert (=> mapNonEmpty!50629 (= (arr!39871 _values!1134) (store mapRest!50629 mapKey!50629 mapValue!50629))))

(declare-fun b!1268792 () Bool)

(declare-fun res!844425 () Bool)

(assert (=> b!1268792 (=> (not res!844425) (not e!723075))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268792 (= res!844425 (and (= (size!40407 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40408 _keys!1364) (size!40407 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50629 () Bool)

(assert (=> mapIsEmpty!50629 mapRes!50629))

(declare-fun b!1268793 () Bool)

(assert (=> b!1268793 (= e!723077 (and e!723078 mapRes!50629))))

(declare-fun condMapEmpty!50629 () Bool)

(declare-fun mapDefault!50629 () ValueCell!15496)

