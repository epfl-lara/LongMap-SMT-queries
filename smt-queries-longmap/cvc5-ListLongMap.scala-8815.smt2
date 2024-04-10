; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107114 () Bool)

(assert start!107114)

(declare-fun b_free!27619 () Bool)

(declare-fun b_next!27619 () Bool)

(assert (=> start!107114 (= b_free!27619 (not b_next!27619))))

(declare-fun tp!97083 () Bool)

(declare-fun b_and!45651 () Bool)

(assert (=> start!107114 (= tp!97083 b_and!45651)))

(declare-fun b!1269963 () Bool)

(declare-fun res!845131 () Bool)

(declare-fun e!723854 () Bool)

(assert (=> b!1269963 (=> (not res!845131) (not e!723854))))

(declare-datatypes ((array!82868 0))(
  ( (array!82869 (arr!39971 (Array (_ BitVec 32) (_ BitVec 64))) (size!40507 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82868)

(declare-datatypes ((List!28459 0))(
  ( (Nil!28456) (Cons!28455 (h!29664 (_ BitVec 64)) (t!41988 List!28459)) )
))
(declare-fun arrayNoDuplicates!0 (array!82868 (_ BitVec 32) List!28459) Bool)

(assert (=> b!1269963 (= res!845131 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28456))))

(declare-fun res!845132 () Bool)

(assert (=> start!107114 (=> (not res!845132) (not e!723854))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107114 (= res!845132 (validMask!0 mask!1730))))

(assert (=> start!107114 e!723854))

(declare-datatypes ((V!48931 0))(
  ( (V!48932 (val!16476 Int)) )
))
(declare-datatypes ((ValueCell!15548 0))(
  ( (ValueCellFull!15548 (v!19113 V!48931)) (EmptyCell!15548) )
))
(declare-datatypes ((array!82870 0))(
  ( (array!82871 (arr!39972 (Array (_ BitVec 32) ValueCell!15548)) (size!40508 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82870)

(declare-fun e!723856 () Bool)

(declare-fun array_inv!30405 (array!82870) Bool)

(assert (=> start!107114 (and (array_inv!30405 _values!1134) e!723856)))

(assert (=> start!107114 true))

(declare-fun array_inv!30406 (array!82868) Bool)

(assert (=> start!107114 (array_inv!30406 _keys!1364)))

(declare-fun tp_is_empty!32803 () Bool)

(assert (=> start!107114 tp_is_empty!32803))

(assert (=> start!107114 tp!97083))

(declare-fun b!1269964 () Bool)

(declare-fun e!723857 () Bool)

(declare-fun mapRes!50785 () Bool)

(assert (=> b!1269964 (= e!723856 (and e!723857 mapRes!50785))))

(declare-fun condMapEmpty!50785 () Bool)

(declare-fun mapDefault!50785 () ValueCell!15548)

