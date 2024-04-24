; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40668 () Bool)

(assert start!40668)

(declare-fun b_free!10693 () Bool)

(declare-fun b_next!10693 () Bool)

(assert (=> start!40668 (= b_free!10693 (not b_next!10693))))

(declare-fun tp!37899 () Bool)

(declare-fun b_and!18715 () Bool)

(assert (=> start!40668 (= tp!37899 b_and!18715)))

(declare-fun res!267599 () Bool)

(declare-fun e!263628 () Bool)

(assert (=> start!40668 (=> (not res!267599) (not e!263628))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27864 0))(
  ( (array!27865 (arr!13377 (Array (_ BitVec 32) (_ BitVec 64))) (size!13729 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27864)

(assert (=> start!40668 (= res!267599 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13729 _keys!709))))))

(assert (=> start!40668 e!263628))

(declare-fun tp_is_empty!12031 () Bool)

(assert (=> start!40668 tp_is_empty!12031))

(assert (=> start!40668 tp!37899))

(assert (=> start!40668 true))

(declare-datatypes ((V!17147 0))(
  ( (V!17148 (val!6060 Int)) )
))
(declare-datatypes ((ValueCell!5672 0))(
  ( (ValueCellFull!5672 (v!8316 V!17147)) (EmptyCell!5672) )
))
(declare-datatypes ((array!27866 0))(
  ( (array!27867 (arr!13378 (Array (_ BitVec 32) ValueCell!5672)) (size!13730 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27866)

(declare-fun e!263626 () Bool)

(declare-fun array_inv!9770 (array!27866) Bool)

(assert (=> start!40668 (and (array_inv!9770 _values!549) e!263626)))

(declare-fun array_inv!9771 (array!27864) Bool)

(assert (=> start!40668 (array_inv!9771 _keys!709)))

(declare-fun b!449713 () Bool)

(declare-fun res!267590 () Bool)

(assert (=> b!449713 (=> (not res!267590) (not e!263628))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27864 (_ BitVec 32)) Bool)

(assert (=> b!449713 (= res!267590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449714 () Bool)

(declare-fun res!267593 () Bool)

(declare-fun e!263625 () Bool)

(assert (=> b!449714 (=> (not res!267593) (not e!263625))))

(declare-fun lt!204451 () array!27864)

(declare-datatypes ((List!7934 0))(
  ( (Nil!7931) (Cons!7930 (h!8786 (_ BitVec 64)) (t!13688 List!7934)) )
))
(declare-fun arrayNoDuplicates!0 (array!27864 (_ BitVec 32) List!7934) Bool)

(assert (=> b!449714 (= res!267593 (arrayNoDuplicates!0 lt!204451 #b00000000000000000000000000000000 Nil!7931))))

(declare-fun b!449715 () Bool)

(declare-fun res!267600 () Bool)

(assert (=> b!449715 (=> (not res!267600) (not e!263628))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449715 (= res!267600 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449716 () Bool)

(assert (=> b!449716 (= e!263628 e!263625)))

(declare-fun res!267591 () Bool)

(assert (=> b!449716 (=> (not res!267591) (not e!263625))))

(assert (=> b!449716 (= res!267591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204451 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449716 (= lt!204451 (array!27865 (store (arr!13377 _keys!709) i!563 k0!794) (size!13729 _keys!709)))))

(declare-fun mapIsEmpty!19680 () Bool)

(declare-fun mapRes!19680 () Bool)

(assert (=> mapIsEmpty!19680 mapRes!19680))

(declare-fun mapNonEmpty!19680 () Bool)

(declare-fun tp!37898 () Bool)

(declare-fun e!263623 () Bool)

(assert (=> mapNonEmpty!19680 (= mapRes!19680 (and tp!37898 e!263623))))

(declare-fun mapValue!19680 () ValueCell!5672)

(declare-fun mapKey!19680 () (_ BitVec 32))

(declare-fun mapRest!19680 () (Array (_ BitVec 32) ValueCell!5672))

(assert (=> mapNonEmpty!19680 (= (arr!13378 _values!549) (store mapRest!19680 mapKey!19680 mapValue!19680))))

(declare-fun b!449717 () Bool)

(assert (=> b!449717 (= e!263623 tp_is_empty!12031)))

(declare-fun b!449718 () Bool)

(declare-fun res!267595 () Bool)

(assert (=> b!449718 (=> (not res!267595) (not e!263628))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!449718 (= res!267595 (and (= (size!13730 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13729 _keys!709) (size!13730 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449719 () Bool)

(declare-fun res!267589 () Bool)

(assert (=> b!449719 (=> (not res!267589) (not e!263628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449719 (= res!267589 (validKeyInArray!0 k0!794))))

(declare-fun b!449720 () Bool)

(declare-fun res!267597 () Bool)

(assert (=> b!449720 (=> (not res!267597) (not e!263628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449720 (= res!267597 (validMask!0 mask!1025))))

(declare-fun b!449721 () Bool)

(declare-fun res!267598 () Bool)

(assert (=> b!449721 (=> (not res!267598) (not e!263628))))

(assert (=> b!449721 (= res!267598 (or (= (select (arr!13377 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13377 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449722 () Bool)

(assert (=> b!449722 (= e!263625 (and (= from!863 i!563) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13729 _keys!709)) (bvsge (bvsub (size!13729 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (bvsub (size!13729 _keys!709) from!863))))))

(declare-fun minValue!515 () V!17147)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7862 0))(
  ( (tuple2!7863 (_1!3942 (_ BitVec 64)) (_2!3942 V!17147)) )
))
(declare-datatypes ((List!7935 0))(
  ( (Nil!7932) (Cons!7931 (h!8787 tuple2!7862) (t!13689 List!7935)) )
))
(declare-datatypes ((ListLongMap!6777 0))(
  ( (ListLongMap!6778 (toList!3404 List!7935)) )
))
(declare-fun lt!204450 () ListLongMap!6777)

(declare-fun zeroValue!515 () V!17147)

(declare-fun v!412 () V!17147)

(declare-fun getCurrentListMapNoExtraKeys!1634 (array!27864 array!27866 (_ BitVec 32) (_ BitVec 32) V!17147 V!17147 (_ BitVec 32) Int) ListLongMap!6777)

(assert (=> b!449722 (= lt!204450 (getCurrentListMapNoExtraKeys!1634 lt!204451 (array!27867 (store (arr!13378 _values!549) i!563 (ValueCellFull!5672 v!412)) (size!13730 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204449 () ListLongMap!6777)

(assert (=> b!449722 (= lt!204449 (getCurrentListMapNoExtraKeys!1634 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449723 () Bool)

(declare-fun res!267596 () Bool)

(assert (=> b!449723 (=> (not res!267596) (not e!263628))))

(assert (=> b!449723 (= res!267596 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7931))))

(declare-fun b!449724 () Bool)

(declare-fun e!263624 () Bool)

(assert (=> b!449724 (= e!263626 (and e!263624 mapRes!19680))))

(declare-fun condMapEmpty!19680 () Bool)

(declare-fun mapDefault!19680 () ValueCell!5672)

(assert (=> b!449724 (= condMapEmpty!19680 (= (arr!13378 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5672)) mapDefault!19680)))))

(declare-fun b!449725 () Bool)

(assert (=> b!449725 (= e!263624 tp_is_empty!12031)))

(declare-fun b!449726 () Bool)

(declare-fun res!267592 () Bool)

(assert (=> b!449726 (=> (not res!267592) (not e!263628))))

(assert (=> b!449726 (= res!267592 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13729 _keys!709))))))

(declare-fun b!449727 () Bool)

(declare-fun res!267594 () Bool)

(assert (=> b!449727 (=> (not res!267594) (not e!263625))))

(assert (=> b!449727 (= res!267594 (bvsle from!863 i!563))))

(assert (= (and start!40668 res!267599) b!449720))

(assert (= (and b!449720 res!267597) b!449718))

(assert (= (and b!449718 res!267595) b!449713))

(assert (= (and b!449713 res!267590) b!449723))

(assert (= (and b!449723 res!267596) b!449726))

(assert (= (and b!449726 res!267592) b!449719))

(assert (= (and b!449719 res!267589) b!449721))

(assert (= (and b!449721 res!267598) b!449715))

(assert (= (and b!449715 res!267600) b!449716))

(assert (= (and b!449716 res!267591) b!449714))

(assert (= (and b!449714 res!267593) b!449727))

(assert (= (and b!449727 res!267594) b!449722))

(assert (= (and b!449724 condMapEmpty!19680) mapIsEmpty!19680))

(assert (= (and b!449724 (not condMapEmpty!19680)) mapNonEmpty!19680))

(get-info :version)

(assert (= (and mapNonEmpty!19680 ((_ is ValueCellFull!5672) mapValue!19680)) b!449717))

(assert (= (and b!449724 ((_ is ValueCellFull!5672) mapDefault!19680)) b!449725))

(assert (= start!40668 b!449724))

(declare-fun m!434091 () Bool)

(assert (=> b!449722 m!434091))

(declare-fun m!434093 () Bool)

(assert (=> b!449722 m!434093))

(declare-fun m!434095 () Bool)

(assert (=> b!449722 m!434095))

(declare-fun m!434097 () Bool)

(assert (=> b!449713 m!434097))

(declare-fun m!434099 () Bool)

(assert (=> b!449721 m!434099))

(declare-fun m!434101 () Bool)

(assert (=> b!449715 m!434101))

(declare-fun m!434103 () Bool)

(assert (=> b!449716 m!434103))

(declare-fun m!434105 () Bool)

(assert (=> b!449716 m!434105))

(declare-fun m!434107 () Bool)

(assert (=> b!449720 m!434107))

(declare-fun m!434109 () Bool)

(assert (=> start!40668 m!434109))

(declare-fun m!434111 () Bool)

(assert (=> start!40668 m!434111))

(declare-fun m!434113 () Bool)

(assert (=> b!449714 m!434113))

(declare-fun m!434115 () Bool)

(assert (=> b!449719 m!434115))

(declare-fun m!434117 () Bool)

(assert (=> b!449723 m!434117))

(declare-fun m!434119 () Bool)

(assert (=> mapNonEmpty!19680 m!434119))

(check-sat (not b!449715) (not start!40668) (not b!449722) (not b!449720) (not b_next!10693) (not b!449714) b_and!18715 (not mapNonEmpty!19680) (not b!449719) tp_is_empty!12031 (not b!449723) (not b!449716) (not b!449713))
(check-sat b_and!18715 (not b_next!10693))
