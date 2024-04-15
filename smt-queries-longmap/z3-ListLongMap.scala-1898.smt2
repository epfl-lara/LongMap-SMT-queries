; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33864 () Bool)

(assert start!33864)

(declare-fun b_free!7057 () Bool)

(declare-fun b_next!7057 () Bool)

(assert (=> start!33864 (= b_free!7057 (not b_next!7057))))

(declare-fun tp!24683 () Bool)

(declare-fun b_and!14217 () Bool)

(assert (=> start!33864 (= tp!24683 b_and!14217)))

(declare-fun b!336986 () Bool)

(declare-fun res!186143 () Bool)

(declare-fun e!206791 () Bool)

(assert (=> b!336986 (=> (not res!186143) (not e!206791))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10323 0))(
  ( (V!10324 (val!3549 Int)) )
))
(declare-datatypes ((ValueCell!3161 0))(
  ( (ValueCellFull!3161 (v!5708 V!10323)) (EmptyCell!3161) )
))
(declare-datatypes ((array!17593 0))(
  ( (array!17594 (arr!8324 (Array (_ BitVec 32) ValueCell!3161)) (size!8677 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17593)

(declare-datatypes ((array!17595 0))(
  ( (array!17596 (arr!8325 (Array (_ BitVec 32) (_ BitVec 64))) (size!8678 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17595)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336986 (= res!186143 (and (= (size!8677 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8678 _keys!1895) (size!8677 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336987 () Bool)

(declare-fun res!186136 () Bool)

(assert (=> b!336987 (=> (not res!186136) (not e!206791))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336987 (= res!186136 (validKeyInArray!0 k0!1348))))

(declare-fun b!336988 () Bool)

(declare-fun res!186142 () Bool)

(assert (=> b!336988 (=> (not res!186142) (not e!206791))))

(declare-fun zeroValue!1467 () V!10323)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10323)

(declare-datatypes ((tuple2!5100 0))(
  ( (tuple2!5101 (_1!2561 (_ BitVec 64)) (_2!2561 V!10323)) )
))
(declare-datatypes ((List!4733 0))(
  ( (Nil!4730) (Cons!4729 (h!5585 tuple2!5100) (t!9818 List!4733)) )
))
(declare-datatypes ((ListLongMap!4003 0))(
  ( (ListLongMap!4004 (toList!2017 List!4733)) )
))
(declare-fun contains!2075 (ListLongMap!4003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1523 (array!17595 array!17593 (_ BitVec 32) (_ BitVec 32) V!10323 V!10323 (_ BitVec 32) Int) ListLongMap!4003)

(assert (=> b!336988 (= res!186142 (not (contains!2075 (getCurrentListMap!1523 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336989 () Bool)

(declare-fun e!206792 () Bool)

(assert (=> b!336989 (= e!206791 e!206792)))

(declare-fun res!186141 () Bool)

(assert (=> b!336989 (=> (not res!186141) (not e!206792))))

(declare-datatypes ((SeekEntryResult!3218 0))(
  ( (MissingZero!3218 (index!15051 (_ BitVec 32))) (Found!3218 (index!15052 (_ BitVec 32))) (Intermediate!3218 (undefined!4030 Bool) (index!15053 (_ BitVec 32)) (x!33609 (_ BitVec 32))) (Undefined!3218) (MissingVacant!3218 (index!15054 (_ BitVec 32))) )
))
(declare-fun lt!160167 () SeekEntryResult!3218)

(get-info :version)

(assert (=> b!336989 (= res!186141 (and (not ((_ is Found!3218) lt!160167)) ((_ is MissingZero!3218) lt!160167)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17595 (_ BitVec 32)) SeekEntryResult!3218)

(assert (=> b!336989 (= lt!160167 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11919 () Bool)

(declare-fun mapRes!11919 () Bool)

(assert (=> mapIsEmpty!11919 mapRes!11919))

(declare-fun mapNonEmpty!11919 () Bool)

(declare-fun tp!24684 () Bool)

(declare-fun e!206790 () Bool)

(assert (=> mapNonEmpty!11919 (= mapRes!11919 (and tp!24684 e!206790))))

(declare-fun mapRest!11919 () (Array (_ BitVec 32) ValueCell!3161))

(declare-fun mapValue!11919 () ValueCell!3161)

(declare-fun mapKey!11919 () (_ BitVec 32))

(assert (=> mapNonEmpty!11919 (= (arr!8324 _values!1525) (store mapRest!11919 mapKey!11919 mapValue!11919))))

(declare-fun b!336990 () Bool)

(declare-fun res!186139 () Bool)

(assert (=> b!336990 (=> (not res!186139) (not e!206792))))

(declare-fun arrayContainsKey!0 (array!17595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336990 (= res!186139 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336991 () Bool)

(declare-fun tp_is_empty!7009 () Bool)

(assert (=> b!336991 (= e!206790 tp_is_empty!7009)))

(declare-fun b!336985 () Bool)

(assert (=> b!336985 (= e!206792 false)))

(declare-fun lt!160166 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17595 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336985 (= lt!160166 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!186140 () Bool)

(assert (=> start!33864 (=> (not res!186140) (not e!206791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33864 (= res!186140 (validMask!0 mask!2385))))

(assert (=> start!33864 e!206791))

(assert (=> start!33864 true))

(assert (=> start!33864 tp_is_empty!7009))

(assert (=> start!33864 tp!24683))

(declare-fun e!206794 () Bool)

(declare-fun array_inv!6210 (array!17593) Bool)

(assert (=> start!33864 (and (array_inv!6210 _values!1525) e!206794)))

(declare-fun array_inv!6211 (array!17595) Bool)

(assert (=> start!33864 (array_inv!6211 _keys!1895)))

(declare-fun b!336992 () Bool)

(declare-fun res!186138 () Bool)

(assert (=> b!336992 (=> (not res!186138) (not e!206791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17595 (_ BitVec 32)) Bool)

(assert (=> b!336992 (= res!186138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336993 () Bool)

(declare-fun res!186137 () Bool)

(assert (=> b!336993 (=> (not res!186137) (not e!206791))))

(declare-datatypes ((List!4734 0))(
  ( (Nil!4731) (Cons!4730 (h!5586 (_ BitVec 64)) (t!9819 List!4734)) )
))
(declare-fun arrayNoDuplicates!0 (array!17595 (_ BitVec 32) List!4734) Bool)

(assert (=> b!336993 (= res!186137 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4731))))

(declare-fun b!336994 () Bool)

(declare-fun e!206793 () Bool)

(assert (=> b!336994 (= e!206793 tp_is_empty!7009)))

(declare-fun b!336995 () Bool)

(assert (=> b!336995 (= e!206794 (and e!206793 mapRes!11919))))

(declare-fun condMapEmpty!11919 () Bool)

(declare-fun mapDefault!11919 () ValueCell!3161)

(assert (=> b!336995 (= condMapEmpty!11919 (= (arr!8324 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3161)) mapDefault!11919)))))

(assert (= (and start!33864 res!186140) b!336986))

(assert (= (and b!336986 res!186143) b!336992))

(assert (= (and b!336992 res!186138) b!336993))

(assert (= (and b!336993 res!186137) b!336987))

(assert (= (and b!336987 res!186136) b!336988))

(assert (= (and b!336988 res!186142) b!336989))

(assert (= (and b!336989 res!186141) b!336990))

(assert (= (and b!336990 res!186139) b!336985))

(assert (= (and b!336995 condMapEmpty!11919) mapIsEmpty!11919))

(assert (= (and b!336995 (not condMapEmpty!11919)) mapNonEmpty!11919))

(assert (= (and mapNonEmpty!11919 ((_ is ValueCellFull!3161) mapValue!11919)) b!336991))

(assert (= (and b!336995 ((_ is ValueCellFull!3161) mapDefault!11919)) b!336994))

(assert (= start!33864 b!336995))

(declare-fun m!340105 () Bool)

(assert (=> b!336989 m!340105))

(declare-fun m!340107 () Bool)

(assert (=> b!336988 m!340107))

(assert (=> b!336988 m!340107))

(declare-fun m!340109 () Bool)

(assert (=> b!336988 m!340109))

(declare-fun m!340111 () Bool)

(assert (=> b!336990 m!340111))

(declare-fun m!340113 () Bool)

(assert (=> b!336985 m!340113))

(declare-fun m!340115 () Bool)

(assert (=> mapNonEmpty!11919 m!340115))

(declare-fun m!340117 () Bool)

(assert (=> b!336987 m!340117))

(declare-fun m!340119 () Bool)

(assert (=> start!33864 m!340119))

(declare-fun m!340121 () Bool)

(assert (=> start!33864 m!340121))

(declare-fun m!340123 () Bool)

(assert (=> start!33864 m!340123))

(declare-fun m!340125 () Bool)

(assert (=> b!336993 m!340125))

(declare-fun m!340127 () Bool)

(assert (=> b!336992 m!340127))

(check-sat b_and!14217 (not b!336989) (not b!336990) (not start!33864) tp_is_empty!7009 (not b_next!7057) (not b!336985) (not b!336993) (not b!336988) (not b!336987) (not mapNonEmpty!11919) (not b!336992))
(check-sat b_and!14217 (not b_next!7057))
