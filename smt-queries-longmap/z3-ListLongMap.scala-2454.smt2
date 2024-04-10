; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38544 () Bool)

(assert start!38544)

(declare-fun b_free!9081 () Bool)

(declare-fun b_next!9081 () Bool)

(assert (=> start!38544 (= b_free!9081 (not b_next!9081))))

(declare-fun tp!32366 () Bool)

(declare-fun b_and!16467 () Bool)

(assert (=> start!38544 (= tp!32366 b_and!16467)))

(declare-fun b!398524 () Bool)

(declare-fun res!229033 () Bool)

(declare-fun e!240853 () Bool)

(assert (=> b!398524 (=> (not res!229033) (not e!240853))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398524 (= res!229033 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16566 () Bool)

(declare-fun mapRes!16566 () Bool)

(assert (=> mapIsEmpty!16566 mapRes!16566))

(declare-fun b!398525 () Bool)

(declare-fun res!229039 () Bool)

(assert (=> b!398525 (=> (not res!229039) (not e!240853))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23837 0))(
  ( (array!23838 (arr!11368 (Array (_ BitVec 32) (_ BitVec 64))) (size!11720 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23837)

(assert (=> b!398525 (= res!229039 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11720 _keys!709))))))

(declare-fun res!229041 () Bool)

(assert (=> start!38544 (=> (not res!229041) (not e!240853))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38544 (= res!229041 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11720 _keys!709))))))

(assert (=> start!38544 e!240853))

(declare-fun tp_is_empty!9963 () Bool)

(assert (=> start!38544 tp_is_empty!9963))

(assert (=> start!38544 tp!32366))

(assert (=> start!38544 true))

(declare-datatypes ((V!14389 0))(
  ( (V!14390 (val!5026 Int)) )
))
(declare-datatypes ((ValueCell!4638 0))(
  ( (ValueCellFull!4638 (v!7273 V!14389)) (EmptyCell!4638) )
))
(declare-datatypes ((array!23839 0))(
  ( (array!23840 (arr!11369 (Array (_ BitVec 32) ValueCell!4638)) (size!11721 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23839)

(declare-fun e!240857 () Bool)

(declare-fun array_inv!8334 (array!23839) Bool)

(assert (=> start!38544 (and (array_inv!8334 _values!549) e!240857)))

(declare-fun array_inv!8335 (array!23837) Bool)

(assert (=> start!38544 (array_inv!8335 _keys!709)))

(declare-fun b!398526 () Bool)

(declare-fun res!229036 () Bool)

(declare-fun e!240858 () Bool)

(assert (=> b!398526 (=> (not res!229036) (not e!240858))))

(declare-fun lt!187468 () array!23837)

(declare-datatypes ((List!6574 0))(
  ( (Nil!6571) (Cons!6570 (h!7426 (_ BitVec 64)) (t!11748 List!6574)) )
))
(declare-fun arrayNoDuplicates!0 (array!23837 (_ BitVec 32) List!6574) Bool)

(assert (=> b!398526 (= res!229036 (arrayNoDuplicates!0 lt!187468 #b00000000000000000000000000000000 Nil!6571))))

(declare-fun b!398527 () Bool)

(declare-fun e!240855 () Bool)

(declare-datatypes ((tuple2!6646 0))(
  ( (tuple2!6647 (_1!3334 (_ BitVec 64)) (_2!3334 V!14389)) )
))
(declare-datatypes ((List!6575 0))(
  ( (Nil!6572) (Cons!6571 (h!7427 tuple2!6646) (t!11749 List!6575)) )
))
(declare-datatypes ((ListLongMap!5559 0))(
  ( (ListLongMap!5560 (toList!2795 List!6575)) )
))
(declare-fun call!27907 () ListLongMap!5559)

(declare-fun call!27908 () ListLongMap!5559)

(assert (=> b!398527 (= e!240855 (= call!27907 call!27908))))

(declare-fun mapNonEmpty!16566 () Bool)

(declare-fun tp!32367 () Bool)

(declare-fun e!240856 () Bool)

(assert (=> mapNonEmpty!16566 (= mapRes!16566 (and tp!32367 e!240856))))

(declare-fun mapRest!16566 () (Array (_ BitVec 32) ValueCell!4638))

(declare-fun mapKey!16566 () (_ BitVec 32))

(declare-fun mapValue!16566 () ValueCell!4638)

(assert (=> mapNonEmpty!16566 (= (arr!11369 _values!549) (store mapRest!16566 mapKey!16566 mapValue!16566))))

(declare-fun b!398528 () Bool)

(assert (=> b!398528 (= e!240853 e!240858)))

(declare-fun res!229034 () Bool)

(assert (=> b!398528 (=> (not res!229034) (not e!240858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23837 (_ BitVec 32)) Bool)

(assert (=> b!398528 (= res!229034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187468 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!398528 (= lt!187468 (array!23838 (store (arr!11368 _keys!709) i!563 k0!794) (size!11720 _keys!709)))))

(declare-fun b!398529 () Bool)

(assert (=> b!398529 (= e!240856 tp_is_empty!9963)))

(declare-fun b!398530 () Bool)

(declare-fun e!240854 () Bool)

(assert (=> b!398530 (= e!240857 (and e!240854 mapRes!16566))))

(declare-fun condMapEmpty!16566 () Bool)

(declare-fun mapDefault!16566 () ValueCell!4638)

(assert (=> b!398530 (= condMapEmpty!16566 (= (arr!11369 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4638)) mapDefault!16566)))))

(declare-fun b!398531 () Bool)

(declare-fun res!229037 () Bool)

(assert (=> b!398531 (=> (not res!229037) (not e!240853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398531 (= res!229037 (validKeyInArray!0 k0!794))))

(declare-fun b!398532 () Bool)

(declare-fun v!412 () V!14389)

(declare-fun +!1087 (ListLongMap!5559 tuple2!6646) ListLongMap!5559)

(assert (=> b!398532 (= e!240855 (= call!27908 (+!1087 call!27907 (tuple2!6647 k0!794 v!412))))))

(declare-fun b!398533 () Bool)

(declare-fun res!229035 () Bool)

(assert (=> b!398533 (=> (not res!229035) (not e!240853))))

(assert (=> b!398533 (= res!229035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398534 () Bool)

(declare-fun res!229038 () Bool)

(assert (=> b!398534 (=> (not res!229038) (not e!240853))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!398534 (= res!229038 (and (= (size!11721 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11720 _keys!709) (size!11721 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398535 () Bool)

(declare-fun res!229040 () Bool)

(assert (=> b!398535 (=> (not res!229040) (not e!240853))))

(declare-fun arrayContainsKey!0 (array!23837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398535 (= res!229040 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398536 () Bool)

(declare-fun res!229032 () Bool)

(assert (=> b!398536 (=> (not res!229032) (not e!240853))))

(assert (=> b!398536 (= res!229032 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6571))))

(declare-fun b!398537 () Bool)

(declare-fun res!229030 () Bool)

(assert (=> b!398537 (=> (not res!229030) (not e!240853))))

(assert (=> b!398537 (= res!229030 (or (= (select (arr!11368 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11368 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398538 () Bool)

(assert (=> b!398538 (= e!240858 (not true))))

(assert (=> b!398538 e!240855))

(declare-fun c!54578 () Bool)

(assert (=> b!398538 (= c!54578 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12080 0))(
  ( (Unit!12081) )
))
(declare-fun lt!187469 () Unit!12080)

(declare-fun minValue!515 () V!14389)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14389)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!298 (array!23837 array!23839 (_ BitVec 32) (_ BitVec 32) V!14389 V!14389 (_ BitVec 32) (_ BitVec 64) V!14389 (_ BitVec 32) Int) Unit!12080)

(assert (=> b!398538 (= lt!187469 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!298 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!27904 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1014 (array!23837 array!23839 (_ BitVec 32) (_ BitVec 32) V!14389 V!14389 (_ BitVec 32) Int) ListLongMap!5559)

(assert (=> bm!27904 (= call!27908 (getCurrentListMapNoExtraKeys!1014 (ite c!54578 lt!187468 _keys!709) (ite c!54578 (array!23840 (store (arr!11369 _values!549) i!563 (ValueCellFull!4638 v!412)) (size!11721 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!27905 () Bool)

(assert (=> bm!27905 (= call!27907 (getCurrentListMapNoExtraKeys!1014 (ite c!54578 _keys!709 lt!187468) (ite c!54578 _values!549 (array!23840 (store (arr!11369 _values!549) i!563 (ValueCellFull!4638 v!412)) (size!11721 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398539 () Bool)

(assert (=> b!398539 (= e!240854 tp_is_empty!9963)))

(declare-fun b!398540 () Bool)

(declare-fun res!229031 () Bool)

(assert (=> b!398540 (=> (not res!229031) (not e!240858))))

(assert (=> b!398540 (= res!229031 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11720 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(assert (= (and start!38544 res!229041) b!398524))

(assert (= (and b!398524 res!229033) b!398534))

(assert (= (and b!398534 res!229038) b!398533))

(assert (= (and b!398533 res!229035) b!398536))

(assert (= (and b!398536 res!229032) b!398525))

(assert (= (and b!398525 res!229039) b!398531))

(assert (= (and b!398531 res!229037) b!398537))

(assert (= (and b!398537 res!229030) b!398535))

(assert (= (and b!398535 res!229040) b!398528))

(assert (= (and b!398528 res!229034) b!398526))

(assert (= (and b!398526 res!229036) b!398540))

(assert (= (and b!398540 res!229031) b!398538))

(assert (= (and b!398538 c!54578) b!398532))

(assert (= (and b!398538 (not c!54578)) b!398527))

(assert (= (or b!398532 b!398527) bm!27904))

(assert (= (or b!398532 b!398527) bm!27905))

(assert (= (and b!398530 condMapEmpty!16566) mapIsEmpty!16566))

(assert (= (and b!398530 (not condMapEmpty!16566)) mapNonEmpty!16566))

(get-info :version)

(assert (= (and mapNonEmpty!16566 ((_ is ValueCellFull!4638) mapValue!16566)) b!398529))

(assert (= (and b!398530 ((_ is ValueCellFull!4638) mapDefault!16566)) b!398539))

(assert (= start!38544 b!398530))

(declare-fun m!393353 () Bool)

(assert (=> start!38544 m!393353))

(declare-fun m!393355 () Bool)

(assert (=> start!38544 m!393355))

(declare-fun m!393357 () Bool)

(assert (=> bm!27904 m!393357))

(declare-fun m!393359 () Bool)

(assert (=> bm!27904 m!393359))

(declare-fun m!393361 () Bool)

(assert (=> b!398531 m!393361))

(declare-fun m!393363 () Bool)

(assert (=> b!398524 m!393363))

(declare-fun m!393365 () Bool)

(assert (=> b!398532 m!393365))

(declare-fun m!393367 () Bool)

(assert (=> b!398528 m!393367))

(declare-fun m!393369 () Bool)

(assert (=> b!398528 m!393369))

(declare-fun m!393371 () Bool)

(assert (=> b!398526 m!393371))

(declare-fun m!393373 () Bool)

(assert (=> b!398536 m!393373))

(declare-fun m!393375 () Bool)

(assert (=> b!398538 m!393375))

(declare-fun m!393377 () Bool)

(assert (=> mapNonEmpty!16566 m!393377))

(declare-fun m!393379 () Bool)

(assert (=> b!398533 m!393379))

(declare-fun m!393381 () Bool)

(assert (=> b!398537 m!393381))

(declare-fun m!393383 () Bool)

(assert (=> b!398535 m!393383))

(assert (=> bm!27905 m!393357))

(declare-fun m!393385 () Bool)

(assert (=> bm!27905 m!393385))

(check-sat (not b!398538) (not bm!27904) (not start!38544) (not b!398526) (not b!398536) (not b!398535) (not b!398531) (not b!398533) (not b!398528) b_and!16467 tp_is_empty!9963 (not bm!27905) (not mapNonEmpty!16566) (not b!398532) (not b!398524) (not b_next!9081))
(check-sat b_and!16467 (not b_next!9081))
