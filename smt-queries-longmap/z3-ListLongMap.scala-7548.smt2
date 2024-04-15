; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95602 () Bool)

(assert start!95602)

(declare-fun b_free!22261 () Bool)

(declare-fun b_next!22261 () Bool)

(assert (=> start!95602 (= b_free!22261 (not b_next!22261))))

(declare-fun tp!78631 () Bool)

(declare-fun b_and!35213 () Bool)

(assert (=> start!95602 (= tp!78631 b_and!35213)))

(declare-fun b!1080060 () Bool)

(declare-fun res!719858 () Bool)

(declare-fun e!617435 () Bool)

(assert (=> b!1080060 (=> (not res!719858) (not e!617435))))

(declare-datatypes ((array!69408 0))(
  ( (array!69409 (arr!33378 (Array (_ BitVec 32) (_ BitVec 64))) (size!33916 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69408)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080060 (= res!719858 (= (select (arr!33378 _keys!1070) i!650) k0!904))))

(declare-fun b!1080061 () Bool)

(declare-fun res!719855 () Bool)

(declare-fun e!617436 () Bool)

(assert (=> b!1080061 (=> (not res!719855) (not e!617436))))

(declare-fun lt!478761 () array!69408)

(declare-datatypes ((List!23333 0))(
  ( (Nil!23330) (Cons!23329 (h!24538 (_ BitVec 64)) (t!32683 List!23333)) )
))
(declare-fun arrayNoDuplicates!0 (array!69408 (_ BitVec 32) List!23333) Bool)

(assert (=> b!1080061 (= res!719855 (arrayNoDuplicates!0 lt!478761 #b00000000000000000000000000000000 Nil!23330))))

(declare-fun b!1080062 () Bool)

(assert (=> b!1080062 (= e!617435 e!617436)))

(declare-fun res!719852 () Bool)

(assert (=> b!1080062 (=> (not res!719852) (not e!617436))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69408 (_ BitVec 32)) Bool)

(assert (=> b!1080062 (= res!719852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478761 mask!1414))))

(assert (=> b!1080062 (= lt!478761 (array!69409 (store (arr!33378 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33916 _keys!1070)))))

(declare-fun b!1080063 () Bool)

(declare-fun e!617434 () Bool)

(declare-fun e!617437 () Bool)

(declare-fun mapRes!41149 () Bool)

(assert (=> b!1080063 (= e!617434 (and e!617437 mapRes!41149))))

(declare-fun condMapEmpty!41149 () Bool)

(declare-datatypes ((V!40145 0))(
  ( (V!40146 (val!13188 Int)) )
))
(declare-datatypes ((ValueCell!12422 0))(
  ( (ValueCellFull!12422 (v!15808 V!40145)) (EmptyCell!12422) )
))
(declare-datatypes ((array!69410 0))(
  ( (array!69411 (arr!33379 (Array (_ BitVec 32) ValueCell!12422)) (size!33917 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69410)

(declare-fun mapDefault!41149 () ValueCell!12422)

(assert (=> b!1080063 (= condMapEmpty!41149 (= (arr!33379 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12422)) mapDefault!41149)))))

(declare-fun b!1080064 () Bool)

(declare-fun res!719853 () Bool)

(assert (=> b!1080064 (=> (not res!719853) (not e!617435))))

(assert (=> b!1080064 (= res!719853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080065 () Bool)

(declare-fun e!617433 () Bool)

(declare-fun tp_is_empty!26263 () Bool)

(assert (=> b!1080065 (= e!617433 tp_is_empty!26263)))

(declare-fun b!1080066 () Bool)

(declare-fun res!719859 () Bool)

(assert (=> b!1080066 (=> (not res!719859) (not e!617435))))

(assert (=> b!1080066 (= res!719859 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33916 _keys!1070))))))

(declare-fun mapNonEmpty!41149 () Bool)

(declare-fun tp!78632 () Bool)

(assert (=> mapNonEmpty!41149 (= mapRes!41149 (and tp!78632 e!617433))))

(declare-fun mapValue!41149 () ValueCell!12422)

(declare-fun mapRest!41149 () (Array (_ BitVec 32) ValueCell!12422))

(declare-fun mapKey!41149 () (_ BitVec 32))

(assert (=> mapNonEmpty!41149 (= (arr!33379 _values!874) (store mapRest!41149 mapKey!41149 mapValue!41149))))

(declare-fun b!1080067 () Bool)

(declare-fun res!719857 () Bool)

(assert (=> b!1080067 (=> (not res!719857) (not e!617435))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080067 (= res!719857 (and (= (size!33917 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33916 _keys!1070) (size!33917 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!719856 () Bool)

(assert (=> start!95602 (=> (not res!719856) (not e!617435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95602 (= res!719856 (validMask!0 mask!1414))))

(assert (=> start!95602 e!617435))

(assert (=> start!95602 tp!78631))

(assert (=> start!95602 true))

(assert (=> start!95602 tp_is_empty!26263))

(declare-fun array_inv!25806 (array!69408) Bool)

(assert (=> start!95602 (array_inv!25806 _keys!1070)))

(declare-fun array_inv!25807 (array!69410) Bool)

(assert (=> start!95602 (and (array_inv!25807 _values!874) e!617434)))

(declare-fun mapIsEmpty!41149 () Bool)

(assert (=> mapIsEmpty!41149 mapRes!41149))

(declare-fun b!1080068 () Bool)

(assert (=> b!1080068 (= e!617437 tp_is_empty!26263)))

(declare-fun b!1080069 () Bool)

(declare-fun res!719851 () Bool)

(assert (=> b!1080069 (=> (not res!719851) (not e!617435))))

(assert (=> b!1080069 (= res!719851 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23330))))

(declare-fun b!1080070 () Bool)

(declare-fun res!719854 () Bool)

(assert (=> b!1080070 (=> (not res!719854) (not e!617435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080070 (= res!719854 (validKeyInArray!0 k0!904))))

(declare-fun b!1080071 () Bool)

(assert (=> b!1080071 (= e!617436 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40145)

(declare-datatypes ((tuple2!16772 0))(
  ( (tuple2!16773 (_1!8397 (_ BitVec 64)) (_2!8397 V!40145)) )
))
(declare-datatypes ((List!23334 0))(
  ( (Nil!23331) (Cons!23330 (h!24539 tuple2!16772) (t!32684 List!23334)) )
))
(declare-datatypes ((ListLongMap!14741 0))(
  ( (ListLongMap!14742 (toList!7386 List!23334)) )
))
(declare-fun lt!478763 () ListLongMap!14741)

(declare-fun zeroValue!831 () V!40145)

(declare-fun getCurrentListMapNoExtraKeys!3949 (array!69408 array!69410 (_ BitVec 32) (_ BitVec 32) V!40145 V!40145 (_ BitVec 32) Int) ListLongMap!14741)

(assert (=> b!1080071 (= lt!478763 (getCurrentListMapNoExtraKeys!3949 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080071 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35365 0))(
  ( (Unit!35366) )
))
(declare-fun lt!478762 () Unit!35365)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69408 (_ BitVec 64) (_ BitVec 32)) Unit!35365)

(assert (=> b!1080071 (= lt!478762 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95602 res!719856) b!1080067))

(assert (= (and b!1080067 res!719857) b!1080064))

(assert (= (and b!1080064 res!719853) b!1080069))

(assert (= (and b!1080069 res!719851) b!1080066))

(assert (= (and b!1080066 res!719859) b!1080070))

(assert (= (and b!1080070 res!719854) b!1080060))

(assert (= (and b!1080060 res!719858) b!1080062))

(assert (= (and b!1080062 res!719852) b!1080061))

(assert (= (and b!1080061 res!719855) b!1080071))

(assert (= (and b!1080063 condMapEmpty!41149) mapIsEmpty!41149))

(assert (= (and b!1080063 (not condMapEmpty!41149)) mapNonEmpty!41149))

(get-info :version)

(assert (= (and mapNonEmpty!41149 ((_ is ValueCellFull!12422) mapValue!41149)) b!1080065))

(assert (= (and b!1080063 ((_ is ValueCellFull!12422) mapDefault!41149)) b!1080068))

(assert (= start!95602 b!1080063))

(declare-fun m!997595 () Bool)

(assert (=> b!1080062 m!997595))

(declare-fun m!997597 () Bool)

(assert (=> b!1080062 m!997597))

(declare-fun m!997599 () Bool)

(assert (=> b!1080060 m!997599))

(declare-fun m!997601 () Bool)

(assert (=> b!1080064 m!997601))

(declare-fun m!997603 () Bool)

(assert (=> b!1080061 m!997603))

(declare-fun m!997605 () Bool)

(assert (=> mapNonEmpty!41149 m!997605))

(declare-fun m!997607 () Bool)

(assert (=> b!1080070 m!997607))

(declare-fun m!997609 () Bool)

(assert (=> b!1080069 m!997609))

(declare-fun m!997611 () Bool)

(assert (=> b!1080071 m!997611))

(declare-fun m!997613 () Bool)

(assert (=> b!1080071 m!997613))

(declare-fun m!997615 () Bool)

(assert (=> b!1080071 m!997615))

(declare-fun m!997617 () Bool)

(assert (=> start!95602 m!997617))

(declare-fun m!997619 () Bool)

(assert (=> start!95602 m!997619))

(declare-fun m!997621 () Bool)

(assert (=> start!95602 m!997621))

(check-sat (not b!1080061) tp_is_empty!26263 (not b!1080071) (not b!1080064) (not b_next!22261) (not b!1080062) b_and!35213 (not mapNonEmpty!41149) (not b!1080070) (not b!1080069) (not start!95602))
(check-sat b_and!35213 (not b_next!22261))
