; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107246 () Bool)

(assert start!107246)

(declare-fun mapIsEmpty!50983 () Bool)

(declare-fun mapRes!50983 () Bool)

(assert (=> mapIsEmpty!50983 mapRes!50983))

(declare-fun mapNonEmpty!50983 () Bool)

(declare-fun tp!97324 () Bool)

(declare-fun e!724848 () Bool)

(assert (=> mapNonEmpty!50983 (= mapRes!50983 (and tp!97324 e!724848))))

(declare-datatypes ((V!49107 0))(
  ( (V!49108 (val!16542 Int)) )
))
(declare-datatypes ((ValueCell!15614 0))(
  ( (ValueCellFull!15614 (v!19179 V!49107)) (EmptyCell!15614) )
))
(declare-datatypes ((array!83122 0))(
  ( (array!83123 (arr!40098 (Array (_ BitVec 32) ValueCell!15614)) (size!40634 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83122)

(declare-fun mapKey!50983 () (_ BitVec 32))

(declare-fun mapValue!50983 () ValueCell!15614)

(declare-fun mapRest!50983 () (Array (_ BitVec 32) ValueCell!15614))

(assert (=> mapNonEmpty!50983 (= (arr!40098 _values!1134) (store mapRest!50983 mapKey!50983 mapValue!50983))))

(declare-fun b!1271238 () Bool)

(declare-fun e!724844 () Bool)

(assert (=> b!1271238 (= e!724844 false)))

(declare-fun lt!574839 () Bool)

(declare-datatypes ((array!83124 0))(
  ( (array!83125 (arr!40099 (Array (_ BitVec 32) (_ BitVec 64))) (size!40635 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83124)

(declare-datatypes ((List!28516 0))(
  ( (Nil!28513) (Cons!28512 (h!29721 (_ BitVec 64)) (t!42045 List!28516)) )
))
(declare-fun arrayNoDuplicates!0 (array!83124 (_ BitVec 32) List!28516) Bool)

(assert (=> b!1271238 (= lt!574839 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28513))))

(declare-fun b!1271239 () Bool)

(declare-fun res!845811 () Bool)

(assert (=> b!1271239 (=> (not res!845811) (not e!724844))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83124 (_ BitVec 32)) Bool)

(assert (=> b!1271239 (= res!845811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271240 () Bool)

(declare-fun res!845812 () Bool)

(assert (=> b!1271240 (=> (not res!845812) (not e!724844))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271240 (= res!845812 (and (= (size!40634 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40635 _keys!1364) (size!40634 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845813 () Bool)

(assert (=> start!107246 (=> (not res!845813) (not e!724844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107246 (= res!845813 (validMask!0 mask!1730))))

(assert (=> start!107246 e!724844))

(declare-fun e!724845 () Bool)

(declare-fun array_inv!30497 (array!83122) Bool)

(assert (=> start!107246 (and (array_inv!30497 _values!1134) e!724845)))

(assert (=> start!107246 true))

(declare-fun array_inv!30498 (array!83124) Bool)

(assert (=> start!107246 (array_inv!30498 _keys!1364)))

(declare-fun b!1271237 () Bool)

(declare-fun e!724847 () Bool)

(declare-fun tp_is_empty!32935 () Bool)

(assert (=> b!1271237 (= e!724847 tp_is_empty!32935)))

(declare-fun b!1271241 () Bool)

(assert (=> b!1271241 (= e!724848 tp_is_empty!32935)))

(declare-fun b!1271242 () Bool)

(assert (=> b!1271242 (= e!724845 (and e!724847 mapRes!50983))))

(declare-fun condMapEmpty!50983 () Bool)

(declare-fun mapDefault!50983 () ValueCell!15614)

