; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38862 () Bool)

(assert start!38862)

(declare-fun b!406001 () Bool)

(declare-fun e!244035 () Bool)

(declare-fun tp_is_empty!10281 () Bool)

(assert (=> b!406001 (= e!244035 tp_is_empty!10281)))

(declare-fun b!406002 () Bool)

(declare-fun res!234438 () Bool)

(declare-fun e!244033 () Bool)

(assert (=> b!406002 (=> (not res!234438) (not e!244033))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406002 (= res!234438 (validKeyInArray!0 k0!794))))

(declare-fun b!406003 () Bool)

(declare-fun res!234439 () Bool)

(assert (=> b!406003 (=> (not res!234439) (not e!244033))))

(declare-datatypes ((array!24453 0))(
  ( (array!24454 (arr!11676 (Array (_ BitVec 32) (_ BitVec 64))) (size!12028 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24453)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14813 0))(
  ( (V!14814 (val!5185 Int)) )
))
(declare-datatypes ((ValueCell!4797 0))(
  ( (ValueCellFull!4797 (v!7432 V!14813)) (EmptyCell!4797) )
))
(declare-datatypes ((array!24455 0))(
  ( (array!24456 (arr!11677 (Array (_ BitVec 32) ValueCell!4797)) (size!12029 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24455)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!406003 (= res!234439 (and (= (size!12029 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12028 _keys!709) (size!12029 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406004 () Bool)

(declare-fun res!234441 () Bool)

(assert (=> b!406004 (=> (not res!234441) (not e!244033))))

(declare-fun arrayContainsKey!0 (array!24453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406004 (= res!234441 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406005 () Bool)

(declare-fun res!234442 () Bool)

(assert (=> b!406005 (=> (not res!234442) (not e!244033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406005 (= res!234442 (validMask!0 mask!1025))))

(declare-fun b!406006 () Bool)

(declare-fun e!244036 () Bool)

(assert (=> b!406006 (= e!244036 false)))

(declare-fun lt!188422 () Bool)

(declare-fun lt!188423 () array!24453)

(declare-datatypes ((List!6784 0))(
  ( (Nil!6781) (Cons!6780 (h!7636 (_ BitVec 64)) (t!11958 List!6784)) )
))
(declare-fun arrayNoDuplicates!0 (array!24453 (_ BitVec 32) List!6784) Bool)

(assert (=> b!406006 (= lt!188422 (arrayNoDuplicates!0 lt!188423 #b00000000000000000000000000000000 Nil!6781))))

(declare-fun b!406007 () Bool)

(declare-fun e!244037 () Bool)

(declare-fun e!244034 () Bool)

(declare-fun mapRes!17043 () Bool)

(assert (=> b!406007 (= e!244037 (and e!244034 mapRes!17043))))

(declare-fun condMapEmpty!17043 () Bool)

(declare-fun mapDefault!17043 () ValueCell!4797)

(assert (=> b!406007 (= condMapEmpty!17043 (= (arr!11677 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4797)) mapDefault!17043)))))

(declare-fun res!234445 () Bool)

(assert (=> start!38862 (=> (not res!234445) (not e!244033))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38862 (= res!234445 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12028 _keys!709))))))

(assert (=> start!38862 e!244033))

(assert (=> start!38862 true))

(declare-fun array_inv!8528 (array!24455) Bool)

(assert (=> start!38862 (and (array_inv!8528 _values!549) e!244037)))

(declare-fun array_inv!8529 (array!24453) Bool)

(assert (=> start!38862 (array_inv!8529 _keys!709)))

(declare-fun b!406008 () Bool)

(declare-fun res!234444 () Bool)

(assert (=> b!406008 (=> (not res!234444) (not e!244033))))

(assert (=> b!406008 (= res!234444 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6781))))

(declare-fun mapNonEmpty!17043 () Bool)

(declare-fun tp!33162 () Bool)

(assert (=> mapNonEmpty!17043 (= mapRes!17043 (and tp!33162 e!244035))))

(declare-fun mapRest!17043 () (Array (_ BitVec 32) ValueCell!4797))

(declare-fun mapValue!17043 () ValueCell!4797)

(declare-fun mapKey!17043 () (_ BitVec 32))

(assert (=> mapNonEmpty!17043 (= (arr!11677 _values!549) (store mapRest!17043 mapKey!17043 mapValue!17043))))

(declare-fun b!406009 () Bool)

(declare-fun res!234443 () Bool)

(assert (=> b!406009 (=> (not res!234443) (not e!244033))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406009 (= res!234443 (or (= (select (arr!11676 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11676 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406010 () Bool)

(assert (=> b!406010 (= e!244033 e!244036)))

(declare-fun res!234447 () Bool)

(assert (=> b!406010 (=> (not res!234447) (not e!244036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24453 (_ BitVec 32)) Bool)

(assert (=> b!406010 (= res!234447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188423 mask!1025))))

(assert (=> b!406010 (= lt!188423 (array!24454 (store (arr!11676 _keys!709) i!563 k0!794) (size!12028 _keys!709)))))

(declare-fun b!406011 () Bool)

(assert (=> b!406011 (= e!244034 tp_is_empty!10281)))

(declare-fun b!406012 () Bool)

(declare-fun res!234446 () Bool)

(assert (=> b!406012 (=> (not res!234446) (not e!244033))))

(assert (=> b!406012 (= res!234446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17043 () Bool)

(assert (=> mapIsEmpty!17043 mapRes!17043))

(declare-fun b!406013 () Bool)

(declare-fun res!234440 () Bool)

(assert (=> b!406013 (=> (not res!234440) (not e!244033))))

(assert (=> b!406013 (= res!234440 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12028 _keys!709))))))

(assert (= (and start!38862 res!234445) b!406005))

(assert (= (and b!406005 res!234442) b!406003))

(assert (= (and b!406003 res!234439) b!406012))

(assert (= (and b!406012 res!234446) b!406008))

(assert (= (and b!406008 res!234444) b!406013))

(assert (= (and b!406013 res!234440) b!406002))

(assert (= (and b!406002 res!234438) b!406009))

(assert (= (and b!406009 res!234443) b!406004))

(assert (= (and b!406004 res!234441) b!406010))

(assert (= (and b!406010 res!234447) b!406006))

(assert (= (and b!406007 condMapEmpty!17043) mapIsEmpty!17043))

(assert (= (and b!406007 (not condMapEmpty!17043)) mapNonEmpty!17043))

(get-info :version)

(assert (= (and mapNonEmpty!17043 ((_ is ValueCellFull!4797) mapValue!17043)) b!406001))

(assert (= (and b!406007 ((_ is ValueCellFull!4797) mapDefault!17043)) b!406011))

(assert (= start!38862 b!406007))

(declare-fun m!398239 () Bool)

(assert (=> b!406002 m!398239))

(declare-fun m!398241 () Bool)

(assert (=> b!406005 m!398241))

(declare-fun m!398243 () Bool)

(assert (=> b!406009 m!398243))

(declare-fun m!398245 () Bool)

(assert (=> b!406012 m!398245))

(declare-fun m!398247 () Bool)

(assert (=> b!406006 m!398247))

(declare-fun m!398249 () Bool)

(assert (=> b!406010 m!398249))

(declare-fun m!398251 () Bool)

(assert (=> b!406010 m!398251))

(declare-fun m!398253 () Bool)

(assert (=> b!406004 m!398253))

(declare-fun m!398255 () Bool)

(assert (=> b!406008 m!398255))

(declare-fun m!398257 () Bool)

(assert (=> start!38862 m!398257))

(declare-fun m!398259 () Bool)

(assert (=> start!38862 m!398259))

(declare-fun m!398261 () Bool)

(assert (=> mapNonEmpty!17043 m!398261))

(check-sat (not b!406012) (not mapNonEmpty!17043) (not b!406004) (not start!38862) (not b!406006) (not b!406005) (not b!406010) tp_is_empty!10281 (not b!406002) (not b!406008))
(check-sat)
