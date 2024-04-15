; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82738 () Bool)

(assert start!82738)

(declare-fun b_free!18889 () Bool)

(declare-fun b_next!18889 () Bool)

(assert (=> start!82738 (= b_free!18889 (not b_next!18889))))

(declare-fun tp!65788 () Bool)

(declare-fun b_and!30351 () Bool)

(assert (=> start!82738 (= tp!65788 b_and!30351)))

(declare-fun b!965007 () Bool)

(declare-fun res!646004 () Bool)

(declare-fun e!543985 () Bool)

(assert (=> b!965007 (=> (not res!646004) (not e!543985))))

(declare-datatypes ((array!59402 0))(
  ( (array!59403 (arr!28570 (Array (_ BitVec 32) (_ BitVec 64))) (size!29051 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59402)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965007 (= res!646004 (validKeyInArray!0 (select (arr!28570 _keys!1686) i!803)))))

(declare-fun res!646002 () Bool)

(assert (=> start!82738 (=> (not res!646002) (not e!543985))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82738 (= res!646002 (validMask!0 mask!2110))))

(assert (=> start!82738 e!543985))

(assert (=> start!82738 true))

(declare-datatypes ((V!33905 0))(
  ( (V!33906 (val!10896 Int)) )
))
(declare-datatypes ((ValueCell!10364 0))(
  ( (ValueCellFull!10364 (v!13453 V!33905)) (EmptyCell!10364) )
))
(declare-datatypes ((array!59404 0))(
  ( (array!59405 (arr!28571 (Array (_ BitVec 32) ValueCell!10364)) (size!29052 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59404)

(declare-fun e!543984 () Bool)

(declare-fun array_inv!22185 (array!59404) Bool)

(assert (=> start!82738 (and (array_inv!22185 _values!1400) e!543984)))

(declare-fun array_inv!22186 (array!59402) Bool)

(assert (=> start!82738 (array_inv!22186 _keys!1686)))

(assert (=> start!82738 tp!65788))

(declare-fun tp_is_empty!21691 () Bool)

(assert (=> start!82738 tp_is_empty!21691))

(declare-fun b!965008 () Bool)

(declare-fun e!543987 () Bool)

(assert (=> b!965008 (= e!543987 tp_is_empty!21691)))

(declare-fun b!965009 () Bool)

(declare-fun res!646001 () Bool)

(assert (=> b!965009 (=> (not res!646001) (not e!543985))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!965009 (= res!646001 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29051 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29051 _keys!1686))))))

(declare-fun b!965010 () Bool)

(declare-fun res!646000 () Bool)

(assert (=> b!965010 (=> (not res!646000) (not e!543985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59402 (_ BitVec 32)) Bool)

(assert (=> b!965010 (= res!646000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965011 () Bool)

(declare-fun res!645999 () Bool)

(assert (=> b!965011 (=> (not res!645999) (not e!543985))))

(declare-datatypes ((List!19884 0))(
  ( (Nil!19881) (Cons!19880 (h!21042 (_ BitVec 64)) (t!28238 List!19884)) )
))
(declare-fun arrayNoDuplicates!0 (array!59402 (_ BitVec 32) List!19884) Bool)

(assert (=> b!965011 (= res!645999 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19881))))

(declare-fun b!965012 () Bool)

(declare-fun e!543988 () Bool)

(declare-fun mapRes!34531 () Bool)

(assert (=> b!965012 (= e!543984 (and e!543988 mapRes!34531))))

(declare-fun condMapEmpty!34531 () Bool)

(declare-fun mapDefault!34531 () ValueCell!10364)

(assert (=> b!965012 (= condMapEmpty!34531 (= (arr!28571 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10364)) mapDefault!34531)))))

(declare-fun mapIsEmpty!34531 () Bool)

(assert (=> mapIsEmpty!34531 mapRes!34531))

(declare-fun b!965013 () Bool)

(assert (=> b!965013 (= e!543985 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33905)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430982 () Bool)

(declare-fun zeroValue!1342 () V!33905)

(declare-datatypes ((tuple2!14076 0))(
  ( (tuple2!14077 (_1!7049 (_ BitVec 64)) (_2!7049 V!33905)) )
))
(declare-datatypes ((List!19885 0))(
  ( (Nil!19882) (Cons!19881 (h!21043 tuple2!14076) (t!28239 List!19885)) )
))
(declare-datatypes ((ListLongMap!12763 0))(
  ( (ListLongMap!12764 (toList!6397 List!19885)) )
))
(declare-fun contains!5444 (ListLongMap!12763 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3559 (array!59402 array!59404 (_ BitVec 32) (_ BitVec 32) V!33905 V!33905 (_ BitVec 32) Int) ListLongMap!12763)

(assert (=> b!965013 (= lt!430982 (contains!5444 (getCurrentListMap!3559 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28570 _keys!1686) i!803)))))

(declare-fun b!965014 () Bool)

(assert (=> b!965014 (= e!543988 tp_is_empty!21691)))

(declare-fun mapNonEmpty!34531 () Bool)

(declare-fun tp!65787 () Bool)

(assert (=> mapNonEmpty!34531 (= mapRes!34531 (and tp!65787 e!543987))))

(declare-fun mapValue!34531 () ValueCell!10364)

(declare-fun mapKey!34531 () (_ BitVec 32))

(declare-fun mapRest!34531 () (Array (_ BitVec 32) ValueCell!10364))

(assert (=> mapNonEmpty!34531 (= (arr!28571 _values!1400) (store mapRest!34531 mapKey!34531 mapValue!34531))))

(declare-fun b!965015 () Bool)

(declare-fun res!646003 () Bool)

(assert (=> b!965015 (=> (not res!646003) (not e!543985))))

(assert (=> b!965015 (= res!646003 (and (= (size!29052 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29051 _keys!1686) (size!29052 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82738 res!646002) b!965015))

(assert (= (and b!965015 res!646003) b!965010))

(assert (= (and b!965010 res!646000) b!965011))

(assert (= (and b!965011 res!645999) b!965009))

(assert (= (and b!965009 res!646001) b!965007))

(assert (= (and b!965007 res!646004) b!965013))

(assert (= (and b!965012 condMapEmpty!34531) mapIsEmpty!34531))

(assert (= (and b!965012 (not condMapEmpty!34531)) mapNonEmpty!34531))

(get-info :version)

(assert (= (and mapNonEmpty!34531 ((_ is ValueCellFull!10364) mapValue!34531)) b!965008))

(assert (= (and b!965012 ((_ is ValueCellFull!10364) mapDefault!34531)) b!965014))

(assert (= start!82738 b!965012))

(declare-fun m!893611 () Bool)

(assert (=> b!965013 m!893611))

(declare-fun m!893613 () Bool)

(assert (=> b!965013 m!893613))

(assert (=> b!965013 m!893611))

(assert (=> b!965013 m!893613))

(declare-fun m!893615 () Bool)

(assert (=> b!965013 m!893615))

(declare-fun m!893617 () Bool)

(assert (=> start!82738 m!893617))

(declare-fun m!893619 () Bool)

(assert (=> start!82738 m!893619))

(declare-fun m!893621 () Bool)

(assert (=> start!82738 m!893621))

(declare-fun m!893623 () Bool)

(assert (=> mapNonEmpty!34531 m!893623))

(assert (=> b!965007 m!893613))

(assert (=> b!965007 m!893613))

(declare-fun m!893625 () Bool)

(assert (=> b!965007 m!893625))

(declare-fun m!893627 () Bool)

(assert (=> b!965011 m!893627))

(declare-fun m!893629 () Bool)

(assert (=> b!965010 m!893629))

(check-sat (not start!82738) tp_is_empty!21691 (not b!965011) (not b_next!18889) (not b!965013) b_and!30351 (not b!965010) (not b!965007) (not mapNonEmpty!34531))
(check-sat b_and!30351 (not b_next!18889))
