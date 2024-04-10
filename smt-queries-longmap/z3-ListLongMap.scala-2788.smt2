; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40618 () Bool)

(assert start!40618)

(declare-fun b_free!10629 () Bool)

(declare-fun b_next!10629 () Bool)

(assert (=> start!40618 (= b_free!10629 (not b_next!10629))))

(declare-fun tp!37707 () Bool)

(declare-fun b_and!18637 () Bool)

(assert (=> start!40618 (= tp!37707 b_and!18637)))

(declare-fun b!448322 () Bool)

(declare-fun res!266445 () Bool)

(declare-fun e!263083 () Bool)

(assert (=> b!448322 (=> (not res!266445) (not e!263083))))

(declare-datatypes ((array!27741 0))(
  ( (array!27742 (arr!13316 (Array (_ BitVec 32) (_ BitVec 64))) (size!13668 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27741)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448322 (= res!266445 (or (= (select (arr!13316 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13316 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448323 () Bool)

(declare-fun res!266449 () Bool)

(declare-fun e!263082 () Bool)

(assert (=> b!448323 (=> (not res!266449) (not e!263082))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!448323 (= res!266449 (bvsle from!863 i!563))))

(declare-fun b!448324 () Bool)

(declare-fun res!266447 () Bool)

(assert (=> b!448324 (=> (not res!266447) (not e!263082))))

(declare-fun lt!204143 () array!27741)

(declare-datatypes ((List!7972 0))(
  ( (Nil!7969) (Cons!7968 (h!8824 (_ BitVec 64)) (t!13734 List!7972)) )
))
(declare-fun arrayNoDuplicates!0 (array!27741 (_ BitVec 32) List!7972) Bool)

(assert (=> b!448324 (= res!266447 (arrayNoDuplicates!0 lt!204143 #b00000000000000000000000000000000 Nil!7969))))

(declare-fun b!448325 () Bool)

(declare-fun res!266442 () Bool)

(assert (=> b!448325 (=> (not res!266442) (not e!263083))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27741 (_ BitVec 32)) Bool)

(assert (=> b!448325 (= res!266442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448326 () Bool)

(declare-fun res!266448 () Bool)

(assert (=> b!448326 (=> (not res!266448) (not e!263083))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448326 (= res!266448 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19584 () Bool)

(declare-fun mapRes!19584 () Bool)

(assert (=> mapIsEmpty!19584 mapRes!19584))

(declare-fun b!448327 () Bool)

(declare-fun res!266441 () Bool)

(assert (=> b!448327 (=> (not res!266441) (not e!263083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448327 (= res!266441 (validMask!0 mask!1025))))

(declare-fun b!448328 () Bool)

(declare-fun res!266446 () Bool)

(assert (=> b!448328 (=> (not res!266446) (not e!263083))))

(assert (=> b!448328 (= res!266446 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13668 _keys!709))))))

(declare-fun res!266451 () Bool)

(assert (=> start!40618 (=> (not res!266451) (not e!263083))))

(assert (=> start!40618 (= res!266451 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13668 _keys!709))))))

(assert (=> start!40618 e!263083))

(declare-fun tp_is_empty!11967 () Bool)

(assert (=> start!40618 tp_is_empty!11967))

(assert (=> start!40618 tp!37707))

(assert (=> start!40618 true))

(declare-datatypes ((V!17061 0))(
  ( (V!17062 (val!6028 Int)) )
))
(declare-datatypes ((ValueCell!5640 0))(
  ( (ValueCellFull!5640 (v!8283 V!17061)) (EmptyCell!5640) )
))
(declare-datatypes ((array!27743 0))(
  ( (array!27744 (arr!13317 (Array (_ BitVec 32) ValueCell!5640)) (size!13669 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27743)

(declare-fun e!263084 () Bool)

(declare-fun array_inv!9648 (array!27743) Bool)

(assert (=> start!40618 (and (array_inv!9648 _values!549) e!263084)))

(declare-fun array_inv!9649 (array!27741) Bool)

(assert (=> start!40618 (array_inv!9649 _keys!709)))

(declare-fun b!448329 () Bool)

(declare-fun res!266444 () Bool)

(assert (=> b!448329 (=> (not res!266444) (not e!263083))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!448329 (= res!266444 (and (= (size!13669 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13668 _keys!709) (size!13669 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448330 () Bool)

(declare-fun e!263080 () Bool)

(assert (=> b!448330 (= e!263084 (and e!263080 mapRes!19584))))

(declare-fun condMapEmpty!19584 () Bool)

(declare-fun mapDefault!19584 () ValueCell!5640)

(assert (=> b!448330 (= condMapEmpty!19584 (= (arr!13317 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5640)) mapDefault!19584)))))

(declare-fun b!448331 () Bool)

(declare-fun e!263081 () Bool)

(assert (=> b!448331 (= e!263081 tp_is_empty!11967)))

(declare-fun b!448332 () Bool)

(assert (=> b!448332 (= e!263083 e!263082)))

(declare-fun res!266440 () Bool)

(assert (=> b!448332 (=> (not res!266440) (not e!263082))))

(assert (=> b!448332 (= res!266440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204143 mask!1025))))

(assert (=> b!448332 (= lt!204143 (array!27742 (store (arr!13316 _keys!709) i!563 k0!794) (size!13668 _keys!709)))))

(declare-fun mapNonEmpty!19584 () Bool)

(declare-fun tp!37706 () Bool)

(assert (=> mapNonEmpty!19584 (= mapRes!19584 (and tp!37706 e!263081))))

(declare-fun mapRest!19584 () (Array (_ BitVec 32) ValueCell!5640))

(declare-fun mapKey!19584 () (_ BitVec 32))

(declare-fun mapValue!19584 () ValueCell!5640)

(assert (=> mapNonEmpty!19584 (= (arr!13317 _values!549) (store mapRest!19584 mapKey!19584 mapValue!19584))))

(declare-fun b!448333 () Bool)

(declare-fun res!266443 () Bool)

(assert (=> b!448333 (=> (not res!266443) (not e!263083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448333 (= res!266443 (validKeyInArray!0 k0!794))))

(declare-fun b!448334 () Bool)

(assert (=> b!448334 (= e!263080 tp_is_empty!11967)))

(declare-fun b!448335 () Bool)

(declare-fun res!266450 () Bool)

(assert (=> b!448335 (=> (not res!266450) (not e!263083))))

(assert (=> b!448335 (= res!266450 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7969))))

(declare-fun b!448336 () Bool)

(assert (=> b!448336 (= e!263082 false)))

(declare-fun minValue!515 () V!17061)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17061)

(declare-fun v!412 () V!17061)

(declare-datatypes ((tuple2!7906 0))(
  ( (tuple2!7907 (_1!3964 (_ BitVec 64)) (_2!3964 V!17061)) )
))
(declare-datatypes ((List!7973 0))(
  ( (Nil!7970) (Cons!7969 (h!8825 tuple2!7906) (t!13735 List!7973)) )
))
(declare-datatypes ((ListLongMap!6819 0))(
  ( (ListLongMap!6820 (toList!3425 List!7973)) )
))
(declare-fun lt!204142 () ListLongMap!6819)

(declare-fun getCurrentListMapNoExtraKeys!1611 (array!27741 array!27743 (_ BitVec 32) (_ BitVec 32) V!17061 V!17061 (_ BitVec 32) Int) ListLongMap!6819)

(assert (=> b!448336 (= lt!204142 (getCurrentListMapNoExtraKeys!1611 lt!204143 (array!27744 (store (arr!13317 _values!549) i!563 (ValueCellFull!5640 v!412)) (size!13669 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204144 () ListLongMap!6819)

(assert (=> b!448336 (= lt!204144 (getCurrentListMapNoExtraKeys!1611 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40618 res!266451) b!448327))

(assert (= (and b!448327 res!266441) b!448329))

(assert (= (and b!448329 res!266444) b!448325))

(assert (= (and b!448325 res!266442) b!448335))

(assert (= (and b!448335 res!266450) b!448328))

(assert (= (and b!448328 res!266446) b!448333))

(assert (= (and b!448333 res!266443) b!448322))

(assert (= (and b!448322 res!266445) b!448326))

(assert (= (and b!448326 res!266448) b!448332))

(assert (= (and b!448332 res!266440) b!448324))

(assert (= (and b!448324 res!266447) b!448323))

(assert (= (and b!448323 res!266449) b!448336))

(assert (= (and b!448330 condMapEmpty!19584) mapIsEmpty!19584))

(assert (= (and b!448330 (not condMapEmpty!19584)) mapNonEmpty!19584))

(get-info :version)

(assert (= (and mapNonEmpty!19584 ((_ is ValueCellFull!5640) mapValue!19584)) b!448331))

(assert (= (and b!448330 ((_ is ValueCellFull!5640) mapDefault!19584)) b!448334))

(assert (= start!40618 b!448330))

(declare-fun m!432913 () Bool)

(assert (=> b!448333 m!432913))

(declare-fun m!432915 () Bool)

(assert (=> b!448324 m!432915))

(declare-fun m!432917 () Bool)

(assert (=> b!448332 m!432917))

(declare-fun m!432919 () Bool)

(assert (=> b!448332 m!432919))

(declare-fun m!432921 () Bool)

(assert (=> b!448322 m!432921))

(declare-fun m!432923 () Bool)

(assert (=> start!40618 m!432923))

(declare-fun m!432925 () Bool)

(assert (=> start!40618 m!432925))

(declare-fun m!432927 () Bool)

(assert (=> mapNonEmpty!19584 m!432927))

(declare-fun m!432929 () Bool)

(assert (=> b!448335 m!432929))

(declare-fun m!432931 () Bool)

(assert (=> b!448325 m!432931))

(declare-fun m!432933 () Bool)

(assert (=> b!448327 m!432933))

(declare-fun m!432935 () Bool)

(assert (=> b!448326 m!432935))

(declare-fun m!432937 () Bool)

(assert (=> b!448336 m!432937))

(declare-fun m!432939 () Bool)

(assert (=> b!448336 m!432939))

(declare-fun m!432941 () Bool)

(assert (=> b!448336 m!432941))

(check-sat tp_is_empty!11967 (not b!448333) (not b!448335) (not b!448336) (not b!448326) b_and!18637 (not b!448327) (not b_next!10629) (not b!448332) (not start!40618) (not mapNonEmpty!19584) (not b!448325) (not b!448324))
(check-sat b_and!18637 (not b_next!10629))
