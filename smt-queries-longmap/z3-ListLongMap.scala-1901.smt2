; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33898 () Bool)

(assert start!33898)

(declare-fun b_free!7077 () Bool)

(declare-fun b_next!7077 () Bool)

(assert (=> start!33898 (= b_free!7077 (not b_next!7077))))

(declare-fun tp!24744 () Bool)

(declare-fun b_and!14263 () Bool)

(assert (=> start!33898 (= tp!24744 b_and!14263)))

(declare-fun b!337590 () Bool)

(declare-fun e!207147 () Bool)

(declare-fun e!207145 () Bool)

(assert (=> b!337590 (= e!207147 e!207145)))

(declare-fun res!186509 () Bool)

(assert (=> b!337590 (=> (not res!186509) (not e!207145))))

(declare-datatypes ((SeekEntryResult!3228 0))(
  ( (MissingZero!3228 (index!15091 (_ BitVec 32))) (Found!3228 (index!15092 (_ BitVec 32))) (Intermediate!3228 (undefined!4040 Bool) (index!15093 (_ BitVec 32)) (x!33648 (_ BitVec 32))) (Undefined!3228) (MissingVacant!3228 (index!15094 (_ BitVec 32))) )
))
(declare-fun lt!160462 () SeekEntryResult!3228)

(get-info :version)

(assert (=> b!337590 (= res!186509 (and (not ((_ is Found!3228) lt!160462)) ((_ is MissingZero!3228) lt!160462)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17653 0))(
  ( (array!17654 (arr!8354 (Array (_ BitVec 32) (_ BitVec 64))) (size!8706 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17653)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17653 (_ BitVec 32)) SeekEntryResult!3228)

(assert (=> b!337590 (= lt!160462 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337591 () Bool)

(declare-fun res!186508 () Bool)

(assert (=> b!337591 (=> (not res!186508) (not e!207147))))

(declare-datatypes ((List!4784 0))(
  ( (Nil!4781) (Cons!4780 (h!5636 (_ BitVec 64)) (t!9878 List!4784)) )
))
(declare-fun arrayNoDuplicates!0 (array!17653 (_ BitVec 32) List!4784) Bool)

(assert (=> b!337591 (= res!186508 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4781))))

(declare-fun b!337592 () Bool)

(declare-fun res!186505 () Bool)

(assert (=> b!337592 (=> (not res!186505) (not e!207147))))

(declare-datatypes ((V!10349 0))(
  ( (V!10350 (val!3559 Int)) )
))
(declare-datatypes ((ValueCell!3171 0))(
  ( (ValueCellFull!3171 (v!5724 V!10349)) (EmptyCell!3171) )
))
(declare-datatypes ((array!17655 0))(
  ( (array!17656 (arr!8355 (Array (_ BitVec 32) ValueCell!3171)) (size!8707 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17655)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337592 (= res!186505 (and (= (size!8707 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8706 _keys!1895) (size!8707 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337593 () Bool)

(declare-fun e!207149 () Bool)

(declare-fun e!207150 () Bool)

(declare-fun mapRes!11949 () Bool)

(assert (=> b!337593 (= e!207149 (and e!207150 mapRes!11949))))

(declare-fun condMapEmpty!11949 () Bool)

(declare-fun mapDefault!11949 () ValueCell!3171)

(assert (=> b!337593 (= condMapEmpty!11949 (= (arr!8355 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3171)) mapDefault!11949)))))

(declare-fun res!186511 () Bool)

(assert (=> start!33898 (=> (not res!186511) (not e!207147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33898 (= res!186511 (validMask!0 mask!2385))))

(assert (=> start!33898 e!207147))

(assert (=> start!33898 true))

(declare-fun tp_is_empty!7029 () Bool)

(assert (=> start!33898 tp_is_empty!7029))

(assert (=> start!33898 tp!24744))

(declare-fun array_inv!6202 (array!17655) Bool)

(assert (=> start!33898 (and (array_inv!6202 _values!1525) e!207149)))

(declare-fun array_inv!6203 (array!17653) Bool)

(assert (=> start!33898 (array_inv!6203 _keys!1895)))

(declare-fun b!337594 () Bool)

(declare-fun e!207148 () Bool)

(assert (=> b!337594 (= e!207148 tp_is_empty!7029)))

(declare-fun mapIsEmpty!11949 () Bool)

(assert (=> mapIsEmpty!11949 mapRes!11949))

(declare-fun b!337595 () Bool)

(declare-fun res!186506 () Bool)

(assert (=> b!337595 (=> (not res!186506) (not e!207147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337595 (= res!186506 (validKeyInArray!0 k0!1348))))

(declare-fun b!337596 () Bool)

(assert (=> b!337596 (= e!207145 false)))

(declare-fun lt!160461 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17653 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337596 (= lt!160461 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337597 () Bool)

(assert (=> b!337597 (= e!207150 tp_is_empty!7029)))

(declare-fun b!337598 () Bool)

(declare-fun res!186510 () Bool)

(assert (=> b!337598 (=> (not res!186510) (not e!207147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17653 (_ BitVec 32)) Bool)

(assert (=> b!337598 (= res!186510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337599 () Bool)

(declare-fun res!186512 () Bool)

(assert (=> b!337599 (=> (not res!186512) (not e!207147))))

(declare-fun zeroValue!1467 () V!10349)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10349)

(declare-datatypes ((tuple2!5168 0))(
  ( (tuple2!5169 (_1!2595 (_ BitVec 64)) (_2!2595 V!10349)) )
))
(declare-datatypes ((List!4785 0))(
  ( (Nil!4782) (Cons!4781 (h!5637 tuple2!5168) (t!9879 List!4785)) )
))
(declare-datatypes ((ListLongMap!4081 0))(
  ( (ListLongMap!4082 (toList!2056 List!4785)) )
))
(declare-fun contains!2103 (ListLongMap!4081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1577 (array!17653 array!17655 (_ BitVec 32) (_ BitVec 32) V!10349 V!10349 (_ BitVec 32) Int) ListLongMap!4081)

(assert (=> b!337599 (= res!186512 (not (contains!2103 (getCurrentListMap!1577 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!11949 () Bool)

(declare-fun tp!24743 () Bool)

(assert (=> mapNonEmpty!11949 (= mapRes!11949 (and tp!24743 e!207148))))

(declare-fun mapValue!11949 () ValueCell!3171)

(declare-fun mapKey!11949 () (_ BitVec 32))

(declare-fun mapRest!11949 () (Array (_ BitVec 32) ValueCell!3171))

(assert (=> mapNonEmpty!11949 (= (arr!8355 _values!1525) (store mapRest!11949 mapKey!11949 mapValue!11949))))

(declare-fun b!337600 () Bool)

(declare-fun res!186507 () Bool)

(assert (=> b!337600 (=> (not res!186507) (not e!207145))))

(declare-fun arrayContainsKey!0 (array!17653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337600 (= res!186507 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!33898 res!186511) b!337592))

(assert (= (and b!337592 res!186505) b!337598))

(assert (= (and b!337598 res!186510) b!337591))

(assert (= (and b!337591 res!186508) b!337595))

(assert (= (and b!337595 res!186506) b!337599))

(assert (= (and b!337599 res!186512) b!337590))

(assert (= (and b!337590 res!186509) b!337600))

(assert (= (and b!337600 res!186507) b!337596))

(assert (= (and b!337593 condMapEmpty!11949) mapIsEmpty!11949))

(assert (= (and b!337593 (not condMapEmpty!11949)) mapNonEmpty!11949))

(assert (= (and mapNonEmpty!11949 ((_ is ValueCellFull!3171) mapValue!11949)) b!337594))

(assert (= (and b!337593 ((_ is ValueCellFull!3171) mapDefault!11949)) b!337597))

(assert (= start!33898 b!337593))

(declare-fun m!341075 () Bool)

(assert (=> b!337599 m!341075))

(assert (=> b!337599 m!341075))

(declare-fun m!341077 () Bool)

(assert (=> b!337599 m!341077))

(declare-fun m!341079 () Bool)

(assert (=> b!337596 m!341079))

(declare-fun m!341081 () Bool)

(assert (=> b!337590 m!341081))

(declare-fun m!341083 () Bool)

(assert (=> b!337598 m!341083))

(declare-fun m!341085 () Bool)

(assert (=> start!33898 m!341085))

(declare-fun m!341087 () Bool)

(assert (=> start!33898 m!341087))

(declare-fun m!341089 () Bool)

(assert (=> start!33898 m!341089))

(declare-fun m!341091 () Bool)

(assert (=> mapNonEmpty!11949 m!341091))

(declare-fun m!341093 () Bool)

(assert (=> b!337595 m!341093))

(declare-fun m!341095 () Bool)

(assert (=> b!337591 m!341095))

(declare-fun m!341097 () Bool)

(assert (=> b!337600 m!341097))

(check-sat (not start!33898) tp_is_empty!7029 (not b!337596) (not b!337590) (not b!337599) (not b!337591) (not b!337600) b_and!14263 (not b!337598) (not b!337595) (not b_next!7077) (not mapNonEmpty!11949))
(check-sat b_and!14263 (not b_next!7077))
