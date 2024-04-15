; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38750 () Bool)

(assert start!38750)

(declare-fun b!403819 () Bool)

(declare-fun res!232839 () Bool)

(declare-fun e!242979 () Bool)

(assert (=> b!403819 (=> (not res!232839) (not e!242979))))

(declare-datatypes ((array!24247 0))(
  ( (array!24248 (arr!11573 (Array (_ BitVec 32) (_ BitVec 64))) (size!11926 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24247)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14683 0))(
  ( (V!14684 (val!5136 Int)) )
))
(declare-datatypes ((ValueCell!4748 0))(
  ( (ValueCellFull!4748 (v!7377 V!14683)) (EmptyCell!4748) )
))
(declare-datatypes ((array!24249 0))(
  ( (array!24250 (arr!11574 (Array (_ BitVec 32) ValueCell!4748)) (size!11927 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24249)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!403819 (= res!232839 (and (= (size!11927 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11926 _keys!709) (size!11927 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403820 () Bool)

(declare-fun res!232846 () Bool)

(assert (=> b!403820 (=> (not res!232846) (not e!242979))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403820 (= res!232846 (or (= (select (arr!11573 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11573 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403821 () Bool)

(declare-fun res!232841 () Bool)

(assert (=> b!403821 (=> (not res!232841) (not e!242979))))

(declare-datatypes ((List!6719 0))(
  ( (Nil!6716) (Cons!6715 (h!7571 (_ BitVec 64)) (t!11884 List!6719)) )
))
(declare-fun arrayNoDuplicates!0 (array!24247 (_ BitVec 32) List!6719) Bool)

(assert (=> b!403821 (= res!232841 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6716))))

(declare-fun b!403822 () Bool)

(declare-fun res!232842 () Bool)

(assert (=> b!403822 (=> (not res!232842) (not e!242979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24247 (_ BitVec 32)) Bool)

(assert (=> b!403822 (= res!232842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403823 () Bool)

(declare-fun res!232844 () Bool)

(assert (=> b!403823 (=> (not res!232844) (not e!242979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403823 (= res!232844 (validMask!0 mask!1025))))

(declare-fun b!403824 () Bool)

(declare-fun e!242982 () Bool)

(declare-fun e!242978 () Bool)

(declare-fun mapRes!16896 () Bool)

(assert (=> b!403824 (= e!242982 (and e!242978 mapRes!16896))))

(declare-fun condMapEmpty!16896 () Bool)

(declare-fun mapDefault!16896 () ValueCell!4748)

(assert (=> b!403824 (= condMapEmpty!16896 (= (arr!11574 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4748)) mapDefault!16896)))))

(declare-fun mapNonEmpty!16896 () Bool)

(declare-fun tp!33015 () Bool)

(declare-fun e!242981 () Bool)

(assert (=> mapNonEmpty!16896 (= mapRes!16896 (and tp!33015 e!242981))))

(declare-fun mapValue!16896 () ValueCell!4748)

(declare-fun mapRest!16896 () (Array (_ BitVec 32) ValueCell!4748))

(declare-fun mapKey!16896 () (_ BitVec 32))

(assert (=> mapNonEmpty!16896 (= (arr!11574 _values!549) (store mapRest!16896 mapKey!16896 mapValue!16896))))

(declare-fun res!232843 () Bool)

(assert (=> start!38750 (=> (not res!232843) (not e!242979))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38750 (= res!232843 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11926 _keys!709))))))

(assert (=> start!38750 e!242979))

(assert (=> start!38750 true))

(declare-fun array_inv!8492 (array!24249) Bool)

(assert (=> start!38750 (and (array_inv!8492 _values!549) e!242982)))

(declare-fun array_inv!8493 (array!24247) Bool)

(assert (=> start!38750 (array_inv!8493 _keys!709)))

(declare-fun b!403825 () Bool)

(declare-fun res!232840 () Bool)

(assert (=> b!403825 (=> (not res!232840) (not e!242979))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403825 (= res!232840 (validKeyInArray!0 k0!794))))

(declare-fun b!403826 () Bool)

(declare-fun tp_is_empty!10183 () Bool)

(assert (=> b!403826 (= e!242981 tp_is_empty!10183)))

(declare-fun b!403827 () Bool)

(declare-fun res!232845 () Bool)

(assert (=> b!403827 (=> (not res!232845) (not e!242979))))

(assert (=> b!403827 (= res!232845 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11926 _keys!709))))))

(declare-fun mapIsEmpty!16896 () Bool)

(assert (=> mapIsEmpty!16896 mapRes!16896))

(declare-fun b!403828 () Bool)

(declare-fun res!232848 () Bool)

(assert (=> b!403828 (=> (not res!232848) (not e!242979))))

(declare-fun arrayContainsKey!0 (array!24247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403828 (= res!232848 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403829 () Bool)

(declare-fun e!242977 () Bool)

(assert (=> b!403829 (= e!242979 e!242977)))

(declare-fun res!232847 () Bool)

(assert (=> b!403829 (=> (not res!232847) (not e!242977))))

(declare-fun lt!187894 () array!24247)

(assert (=> b!403829 (= res!232847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187894 mask!1025))))

(assert (=> b!403829 (= lt!187894 (array!24248 (store (arr!11573 _keys!709) i!563 k0!794) (size!11926 _keys!709)))))

(declare-fun b!403830 () Bool)

(assert (=> b!403830 (= e!242977 false)))

(declare-fun lt!187895 () Bool)

(assert (=> b!403830 (= lt!187895 (arrayNoDuplicates!0 lt!187894 #b00000000000000000000000000000000 Nil!6716))))

(declare-fun b!403831 () Bool)

(assert (=> b!403831 (= e!242978 tp_is_empty!10183)))

(assert (= (and start!38750 res!232843) b!403823))

(assert (= (and b!403823 res!232844) b!403819))

(assert (= (and b!403819 res!232839) b!403822))

(assert (= (and b!403822 res!232842) b!403821))

(assert (= (and b!403821 res!232841) b!403827))

(assert (= (and b!403827 res!232845) b!403825))

(assert (= (and b!403825 res!232840) b!403820))

(assert (= (and b!403820 res!232846) b!403828))

(assert (= (and b!403828 res!232848) b!403829))

(assert (= (and b!403829 res!232847) b!403830))

(assert (= (and b!403824 condMapEmpty!16896) mapIsEmpty!16896))

(assert (= (and b!403824 (not condMapEmpty!16896)) mapNonEmpty!16896))

(get-info :version)

(assert (= (and mapNonEmpty!16896 ((_ is ValueCellFull!4748) mapValue!16896)) b!403826))

(assert (= (and b!403824 ((_ is ValueCellFull!4748) mapDefault!16896)) b!403831))

(assert (= start!38750 b!403824))

(declare-fun m!396339 () Bool)

(assert (=> mapNonEmpty!16896 m!396339))

(declare-fun m!396341 () Bool)

(assert (=> b!403828 m!396341))

(declare-fun m!396343 () Bool)

(assert (=> b!403820 m!396343))

(declare-fun m!396345 () Bool)

(assert (=> b!403829 m!396345))

(declare-fun m!396347 () Bool)

(assert (=> b!403829 m!396347))

(declare-fun m!396349 () Bool)

(assert (=> b!403830 m!396349))

(declare-fun m!396351 () Bool)

(assert (=> b!403825 m!396351))

(declare-fun m!396353 () Bool)

(assert (=> b!403823 m!396353))

(declare-fun m!396355 () Bool)

(assert (=> b!403822 m!396355))

(declare-fun m!396357 () Bool)

(assert (=> b!403821 m!396357))

(declare-fun m!396359 () Bool)

(assert (=> start!38750 m!396359))

(declare-fun m!396361 () Bool)

(assert (=> start!38750 m!396361))

(check-sat (not start!38750) tp_is_empty!10183 (not mapNonEmpty!16896) (not b!403822) (not b!403821) (not b!403823) (not b!403825) (not b!403830) (not b!403829) (not b!403828))
(check-sat)
