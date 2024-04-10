; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3756 () Bool)

(assert start!3756)

(declare-fun b!26198 () Bool)

(declare-fun e!17023 () Bool)

(declare-fun tp_is_empty!1077 () Bool)

(assert (=> b!26198 (= e!17023 tp_is_empty!1077)))

(declare-fun res!15575 () Bool)

(declare-fun e!17020 () Bool)

(assert (=> start!3756 (=> (not res!15575) (not e!17020))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3756 (= res!15575 (validMask!0 mask!2294))))

(assert (=> start!3756 e!17020))

(assert (=> start!3756 true))

(declare-datatypes ((V!1261 0))(
  ( (V!1262 (val!565 Int)) )
))
(declare-datatypes ((ValueCell!339 0))(
  ( (ValueCellFull!339 (v!1651 V!1261)) (EmptyCell!339) )
))
(declare-datatypes ((array!1401 0))(
  ( (array!1402 (arr!658 (Array (_ BitVec 32) ValueCell!339)) (size!759 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1401)

(declare-fun e!17024 () Bool)

(declare-fun array_inv!447 (array!1401) Bool)

(assert (=> start!3756 (and (array_inv!447 _values!1501) e!17024)))

(declare-datatypes ((array!1403 0))(
  ( (array!1404 (arr!659 (Array (_ BitVec 32) (_ BitVec 64))) (size!760 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1403)

(declare-fun array_inv!448 (array!1403) Bool)

(assert (=> start!3756 (array_inv!448 _keys!1833)))

(declare-fun b!26199 () Bool)

(declare-fun res!15576 () Bool)

(assert (=> b!26199 (=> (not res!15576) (not e!17020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1403 (_ BitVec 32)) Bool)

(assert (=> b!26199 (= res!15576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26200 () Bool)

(declare-fun e!17021 () Bool)

(assert (=> b!26200 (= e!17021 tp_is_empty!1077)))

(declare-fun mapNonEmpty!1132 () Bool)

(declare-fun mapRes!1132 () Bool)

(declare-fun tp!3652 () Bool)

(assert (=> mapNonEmpty!1132 (= mapRes!1132 (and tp!3652 e!17023))))

(declare-fun mapValue!1132 () ValueCell!339)

(declare-fun mapRest!1132 () (Array (_ BitVec 32) ValueCell!339))

(declare-fun mapKey!1132 () (_ BitVec 32))

(assert (=> mapNonEmpty!1132 (= (arr!658 _values!1501) (store mapRest!1132 mapKey!1132 mapValue!1132))))

(declare-fun b!26201 () Bool)

(assert (=> b!26201 (= e!17024 (and e!17021 mapRes!1132))))

(declare-fun condMapEmpty!1132 () Bool)

(declare-fun mapDefault!1132 () ValueCell!339)

(assert (=> b!26201 (= condMapEmpty!1132 (= (arr!658 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!339)) mapDefault!1132)))))

(declare-fun mapIsEmpty!1132 () Bool)

(assert (=> mapIsEmpty!1132 mapRes!1132))

(declare-fun b!26202 () Bool)

(assert (=> b!26202 (= e!17020 false)))

(declare-fun lt!10325 () Bool)

(declare-datatypes ((List!581 0))(
  ( (Nil!578) (Cons!577 (h!1144 (_ BitVec 64)) (t!3268 List!581)) )
))
(declare-fun arrayNoDuplicates!0 (array!1403 (_ BitVec 32) List!581) Bool)

(assert (=> b!26202 (= lt!10325 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!578))))

(declare-fun b!26203 () Bool)

(declare-fun res!15574 () Bool)

(assert (=> b!26203 (=> (not res!15574) (not e!17020))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26203 (= res!15574 (and (= (size!759 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!760 _keys!1833) (size!759 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!3756 res!15575) b!26203))

(assert (= (and b!26203 res!15574) b!26199))

(assert (= (and b!26199 res!15576) b!26202))

(assert (= (and b!26201 condMapEmpty!1132) mapIsEmpty!1132))

(assert (= (and b!26201 (not condMapEmpty!1132)) mapNonEmpty!1132))

(get-info :version)

(assert (= (and mapNonEmpty!1132 ((_ is ValueCellFull!339) mapValue!1132)) b!26198))

(assert (= (and b!26201 ((_ is ValueCellFull!339) mapDefault!1132)) b!26200))

(assert (= start!3756 b!26201))

(declare-fun m!21053 () Bool)

(assert (=> start!3756 m!21053))

(declare-fun m!21055 () Bool)

(assert (=> start!3756 m!21055))

(declare-fun m!21057 () Bool)

(assert (=> start!3756 m!21057))

(declare-fun m!21059 () Bool)

(assert (=> b!26199 m!21059))

(declare-fun m!21061 () Bool)

(assert (=> mapNonEmpty!1132 m!21061))

(declare-fun m!21063 () Bool)

(assert (=> b!26202 m!21063))

(check-sat (not mapNonEmpty!1132) (not start!3756) (not b!26202) (not b!26199) tp_is_empty!1077)
(check-sat)
