; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33592 () Bool)

(assert start!33592)

(declare-fun b_free!6841 () Bool)

(declare-fun b_next!6841 () Bool)

(assert (=> start!33592 (= b_free!6841 (not b_next!6841))))

(declare-fun tp!24026 () Bool)

(declare-fun b_and!13995 () Bool)

(assert (=> start!33592 (= tp!24026 b_and!13995)))

(declare-fun mapIsEmpty!11586 () Bool)

(declare-fun mapRes!11586 () Bool)

(assert (=> mapIsEmpty!11586 mapRes!11586))

(declare-fun b!333174 () Bool)

(declare-fun e!204577 () Bool)

(assert (=> b!333174 (= e!204577 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3134 0))(
  ( (MissingZero!3134 (index!14715 (_ BitVec 32))) (Found!3134 (index!14716 (_ BitVec 32))) (Intermediate!3134 (undefined!3946 Bool) (index!14717 (_ BitVec 32)) (x!33207 (_ BitVec 32))) (Undefined!3134) (MissingVacant!3134 (index!14718 (_ BitVec 32))) )
))
(declare-fun lt!159129 () SeekEntryResult!3134)

(declare-datatypes ((array!17169 0))(
  ( (array!17170 (arr!8115 (Array (_ BitVec 32) (_ BitVec 64))) (size!8468 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17169)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17169 (_ BitVec 32)) SeekEntryResult!3134)

(assert (=> b!333174 (= lt!159129 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333175 () Bool)

(declare-fun e!204580 () Bool)

(declare-fun tp_is_empty!6793 () Bool)

(assert (=> b!333175 (= e!204580 tp_is_empty!6793)))

(declare-fun mapNonEmpty!11586 () Bool)

(declare-fun tp!24027 () Bool)

(assert (=> mapNonEmpty!11586 (= mapRes!11586 (and tp!24027 e!204580))))

(declare-datatypes ((V!10035 0))(
  ( (V!10036 (val!3441 Int)) )
))
(declare-datatypes ((ValueCell!3053 0))(
  ( (ValueCellFull!3053 (v!5597 V!10035)) (EmptyCell!3053) )
))
(declare-fun mapRest!11586 () (Array (_ BitVec 32) ValueCell!3053))

(declare-fun mapKey!11586 () (_ BitVec 32))

(declare-datatypes ((array!17171 0))(
  ( (array!17172 (arr!8116 (Array (_ BitVec 32) ValueCell!3053)) (size!8469 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17171)

(declare-fun mapValue!11586 () ValueCell!3053)

(assert (=> mapNonEmpty!11586 (= (arr!8116 _values!1525) (store mapRest!11586 mapKey!11586 mapValue!11586))))

(declare-fun b!333176 () Bool)

(declare-fun res!183547 () Bool)

(assert (=> b!333176 (=> (not res!183547) (not e!204577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333176 (= res!183547 (validKeyInArray!0 k0!1348))))

(declare-fun b!333177 () Bool)

(declare-fun res!183548 () Bool)

(assert (=> b!333177 (=> (not res!183548) (not e!204577))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333177 (= res!183548 (and (= (size!8469 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8468 _keys!1895) (size!8469 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333178 () Bool)

(declare-fun res!183545 () Bool)

(assert (=> b!333178 (=> (not res!183545) (not e!204577))))

(declare-fun zeroValue!1467 () V!10035)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10035)

(declare-datatypes ((tuple2!4950 0))(
  ( (tuple2!4951 (_1!2486 (_ BitVec 64)) (_2!2486 V!10035)) )
))
(declare-datatypes ((List!4588 0))(
  ( (Nil!4585) (Cons!4584 (h!5440 tuple2!4950) (t!9667 List!4588)) )
))
(declare-datatypes ((ListLongMap!3853 0))(
  ( (ListLongMap!3854 (toList!1942 List!4588)) )
))
(declare-fun contains!1997 (ListLongMap!3853 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1451 (array!17169 array!17171 (_ BitVec 32) (_ BitVec 32) V!10035 V!10035 (_ BitVec 32) Int) ListLongMap!3853)

(assert (=> b!333178 (= res!183545 (not (contains!1997 (getCurrentListMap!1451 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333180 () Bool)

(declare-fun res!183544 () Bool)

(assert (=> b!333180 (=> (not res!183544) (not e!204577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17169 (_ BitVec 32)) Bool)

(assert (=> b!333180 (= res!183544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333181 () Bool)

(declare-fun e!204578 () Bool)

(assert (=> b!333181 (= e!204578 tp_is_empty!6793)))

(declare-fun b!333182 () Bool)

(declare-fun res!183543 () Bool)

(assert (=> b!333182 (=> (not res!183543) (not e!204577))))

(declare-datatypes ((List!4589 0))(
  ( (Nil!4586) (Cons!4585 (h!5441 (_ BitVec 64)) (t!9668 List!4589)) )
))
(declare-fun arrayNoDuplicates!0 (array!17169 (_ BitVec 32) List!4589) Bool)

(assert (=> b!333182 (= res!183543 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4586))))

(declare-fun res!183546 () Bool)

(assert (=> start!33592 (=> (not res!183546) (not e!204577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33592 (= res!183546 (validMask!0 mask!2385))))

(assert (=> start!33592 e!204577))

(assert (=> start!33592 true))

(assert (=> start!33592 tp_is_empty!6793))

(assert (=> start!33592 tp!24026))

(declare-fun e!204576 () Bool)

(declare-fun array_inv!6054 (array!17171) Bool)

(assert (=> start!33592 (and (array_inv!6054 _values!1525) e!204576)))

(declare-fun array_inv!6055 (array!17169) Bool)

(assert (=> start!33592 (array_inv!6055 _keys!1895)))

(declare-fun b!333179 () Bool)

(assert (=> b!333179 (= e!204576 (and e!204578 mapRes!11586))))

(declare-fun condMapEmpty!11586 () Bool)

(declare-fun mapDefault!11586 () ValueCell!3053)

(assert (=> b!333179 (= condMapEmpty!11586 (= (arr!8116 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3053)) mapDefault!11586)))))

(assert (= (and start!33592 res!183546) b!333177))

(assert (= (and b!333177 res!183548) b!333180))

(assert (= (and b!333180 res!183544) b!333182))

(assert (= (and b!333182 res!183543) b!333176))

(assert (= (and b!333176 res!183547) b!333178))

(assert (= (and b!333178 res!183545) b!333174))

(assert (= (and b!333179 condMapEmpty!11586) mapIsEmpty!11586))

(assert (= (and b!333179 (not condMapEmpty!11586)) mapNonEmpty!11586))

(get-info :version)

(assert (= (and mapNonEmpty!11586 ((_ is ValueCellFull!3053) mapValue!11586)) b!333175))

(assert (= (and b!333179 ((_ is ValueCellFull!3053) mapDefault!11586)) b!333181))

(assert (= start!33592 b!333179))

(declare-fun m!336971 () Bool)

(assert (=> mapNonEmpty!11586 m!336971))

(declare-fun m!336973 () Bool)

(assert (=> b!333174 m!336973))

(declare-fun m!336975 () Bool)

(assert (=> b!333178 m!336975))

(assert (=> b!333178 m!336975))

(declare-fun m!336977 () Bool)

(assert (=> b!333178 m!336977))

(declare-fun m!336979 () Bool)

(assert (=> b!333180 m!336979))

(declare-fun m!336981 () Bool)

(assert (=> b!333182 m!336981))

(declare-fun m!336983 () Bool)

(assert (=> b!333176 m!336983))

(declare-fun m!336985 () Bool)

(assert (=> start!33592 m!336985))

(declare-fun m!336987 () Bool)

(assert (=> start!33592 m!336987))

(declare-fun m!336989 () Bool)

(assert (=> start!33592 m!336989))

(check-sat (not mapNonEmpty!11586) (not b!333174) (not start!33592) (not b!333176) (not b!333178) tp_is_empty!6793 (not b!333180) (not b!333182) b_and!13995 (not b_next!6841))
(check-sat b_and!13995 (not b_next!6841))
