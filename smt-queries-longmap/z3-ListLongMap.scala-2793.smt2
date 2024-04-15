; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40632 () Bool)

(assert start!40632)

(declare-fun b_free!10657 () Bool)

(declare-fun b_next!10657 () Bool)

(assert (=> start!40632 (= b_free!10657 (not b_next!10657))))

(declare-fun tp!37791 () Bool)

(declare-fun b_and!18639 () Bool)

(assert (=> start!40632 (= tp!37791 b_and!18639)))

(declare-fun res!266822 () Bool)

(declare-fun e!263157 () Bool)

(assert (=> start!40632 (=> (not res!266822) (not e!263157))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27795 0))(
  ( (array!27796 (arr!13343 (Array (_ BitVec 32) (_ BitVec 64))) (size!13696 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27795)

(assert (=> start!40632 (= res!266822 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13696 _keys!709))))))

(assert (=> start!40632 e!263157))

(declare-fun tp_is_empty!11995 () Bool)

(assert (=> start!40632 tp_is_empty!11995))

(assert (=> start!40632 tp!37791))

(assert (=> start!40632 true))

(declare-datatypes ((V!17099 0))(
  ( (V!17100 (val!6042 Int)) )
))
(declare-datatypes ((ValueCell!5654 0))(
  ( (ValueCellFull!5654 (v!8291 V!17099)) (EmptyCell!5654) )
))
(declare-datatypes ((array!27797 0))(
  ( (array!27798 (arr!13344 (Array (_ BitVec 32) ValueCell!5654)) (size!13697 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27797)

(declare-fun e!263162 () Bool)

(declare-fun array_inv!9724 (array!27797) Bool)

(assert (=> start!40632 (and (array_inv!9724 _values!549) e!263162)))

(declare-fun array_inv!9725 (array!27795) Bool)

(assert (=> start!40632 (array_inv!9725 _keys!709)))

(declare-fun b!448681 () Bool)

(declare-fun res!266821 () Bool)

(declare-fun e!263158 () Bool)

(assert (=> b!448681 (=> (not res!266821) (not e!263158))))

(declare-fun lt!204035 () array!27795)

(declare-datatypes ((List!8000 0))(
  ( (Nil!7997) (Cons!7996 (h!8852 (_ BitVec 64)) (t!13753 List!8000)) )
))
(declare-fun arrayNoDuplicates!0 (array!27795 (_ BitVec 32) List!8000) Bool)

(assert (=> b!448681 (= res!266821 (arrayNoDuplicates!0 lt!204035 #b00000000000000000000000000000000 Nil!7997))))

(declare-fun mapIsEmpty!19626 () Bool)

(declare-fun mapRes!19626 () Bool)

(assert (=> mapIsEmpty!19626 mapRes!19626))

(declare-fun b!448682 () Bool)

(assert (=> b!448682 (= e!263157 e!263158)))

(declare-fun res!266818 () Bool)

(assert (=> b!448682 (=> (not res!266818) (not e!263158))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27795 (_ BitVec 32)) Bool)

(assert (=> b!448682 (= res!266818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204035 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448682 (= lt!204035 (array!27796 (store (arr!13343 _keys!709) i!563 k0!794) (size!13696 _keys!709)))))

(declare-fun b!448683 () Bool)

(declare-fun e!263161 () Bool)

(assert (=> b!448683 (= e!263161 tp_is_empty!11995)))

(declare-fun b!448684 () Bool)

(assert (=> b!448684 (= e!263158 false)))

(declare-fun minValue!515 () V!17099)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17099)

(declare-fun v!412 () V!17099)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7936 0))(
  ( (tuple2!7937 (_1!3979 (_ BitVec 64)) (_2!3979 V!17099)) )
))
(declare-datatypes ((List!8001 0))(
  ( (Nil!7998) (Cons!7997 (h!8853 tuple2!7936) (t!13754 List!8001)) )
))
(declare-datatypes ((ListLongMap!6839 0))(
  ( (ListLongMap!6840 (toList!3435 List!8001)) )
))
(declare-fun lt!204036 () ListLongMap!6839)

(declare-fun getCurrentListMapNoExtraKeys!1633 (array!27795 array!27797 (_ BitVec 32) (_ BitVec 32) V!17099 V!17099 (_ BitVec 32) Int) ListLongMap!6839)

(assert (=> b!448684 (= lt!204036 (getCurrentListMapNoExtraKeys!1633 lt!204035 (array!27798 (store (arr!13344 _values!549) i!563 (ValueCellFull!5654 v!412)) (size!13697 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204034 () ListLongMap!6839)

(assert (=> b!448684 (= lt!204034 (getCurrentListMapNoExtraKeys!1633 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448685 () Bool)

(declare-fun res!266826 () Bool)

(assert (=> b!448685 (=> (not res!266826) (not e!263158))))

(assert (=> b!448685 (= res!266826 (bvsle from!863 i!563))))

(declare-fun b!448686 () Bool)

(declare-fun res!266820 () Bool)

(assert (=> b!448686 (=> (not res!266820) (not e!263157))))

(assert (=> b!448686 (= res!266820 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7997))))

(declare-fun b!448687 () Bool)

(declare-fun res!266815 () Bool)

(assert (=> b!448687 (=> (not res!266815) (not e!263157))))

(assert (=> b!448687 (= res!266815 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13696 _keys!709))))))

(declare-fun b!448688 () Bool)

(declare-fun res!266819 () Bool)

(assert (=> b!448688 (=> (not res!266819) (not e!263157))))

(assert (=> b!448688 (= res!266819 (and (= (size!13697 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13696 _keys!709) (size!13697 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448689 () Bool)

(declare-fun res!266824 () Bool)

(assert (=> b!448689 (=> (not res!266824) (not e!263157))))

(assert (=> b!448689 (= res!266824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448690 () Bool)

(declare-fun e!263160 () Bool)

(assert (=> b!448690 (= e!263160 tp_is_empty!11995)))

(declare-fun b!448691 () Bool)

(declare-fun res!266823 () Bool)

(assert (=> b!448691 (=> (not res!266823) (not e!263157))))

(assert (=> b!448691 (= res!266823 (or (= (select (arr!13343 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13343 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448692 () Bool)

(assert (=> b!448692 (= e!263162 (and e!263161 mapRes!19626))))

(declare-fun condMapEmpty!19626 () Bool)

(declare-fun mapDefault!19626 () ValueCell!5654)

(assert (=> b!448692 (= condMapEmpty!19626 (= (arr!13344 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5654)) mapDefault!19626)))))

(declare-fun b!448693 () Bool)

(declare-fun res!266816 () Bool)

(assert (=> b!448693 (=> (not res!266816) (not e!263157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448693 (= res!266816 (validKeyInArray!0 k0!794))))

(declare-fun b!448694 () Bool)

(declare-fun res!266817 () Bool)

(assert (=> b!448694 (=> (not res!266817) (not e!263157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448694 (= res!266817 (validMask!0 mask!1025))))

(declare-fun b!448695 () Bool)

(declare-fun res!266825 () Bool)

(assert (=> b!448695 (=> (not res!266825) (not e!263157))))

(declare-fun arrayContainsKey!0 (array!27795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448695 (= res!266825 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19626 () Bool)

(declare-fun tp!37790 () Bool)

(assert (=> mapNonEmpty!19626 (= mapRes!19626 (and tp!37790 e!263160))))

(declare-fun mapValue!19626 () ValueCell!5654)

(declare-fun mapRest!19626 () (Array (_ BitVec 32) ValueCell!5654))

(declare-fun mapKey!19626 () (_ BitVec 32))

(assert (=> mapNonEmpty!19626 (= (arr!13344 _values!549) (store mapRest!19626 mapKey!19626 mapValue!19626))))

(assert (= (and start!40632 res!266822) b!448694))

(assert (= (and b!448694 res!266817) b!448688))

(assert (= (and b!448688 res!266819) b!448689))

(assert (= (and b!448689 res!266824) b!448686))

(assert (= (and b!448686 res!266820) b!448687))

(assert (= (and b!448687 res!266815) b!448693))

(assert (= (and b!448693 res!266816) b!448691))

(assert (= (and b!448691 res!266823) b!448695))

(assert (= (and b!448695 res!266825) b!448682))

(assert (= (and b!448682 res!266818) b!448681))

(assert (= (and b!448681 res!266821) b!448685))

(assert (= (and b!448685 res!266826) b!448684))

(assert (= (and b!448692 condMapEmpty!19626) mapIsEmpty!19626))

(assert (= (and b!448692 (not condMapEmpty!19626)) mapNonEmpty!19626))

(get-info :version)

(assert (= (and mapNonEmpty!19626 ((_ is ValueCellFull!5654) mapValue!19626)) b!448690))

(assert (= (and b!448692 ((_ is ValueCellFull!5654) mapDefault!19626)) b!448683))

(assert (= start!40632 b!448692))

(declare-fun m!432601 () Bool)

(assert (=> start!40632 m!432601))

(declare-fun m!432603 () Bool)

(assert (=> start!40632 m!432603))

(declare-fun m!432605 () Bool)

(assert (=> mapNonEmpty!19626 m!432605))

(declare-fun m!432607 () Bool)

(assert (=> b!448693 m!432607))

(declare-fun m!432609 () Bool)

(assert (=> b!448686 m!432609))

(declare-fun m!432611 () Bool)

(assert (=> b!448681 m!432611))

(declare-fun m!432613 () Bool)

(assert (=> b!448694 m!432613))

(declare-fun m!432615 () Bool)

(assert (=> b!448682 m!432615))

(declare-fun m!432617 () Bool)

(assert (=> b!448682 m!432617))

(declare-fun m!432619 () Bool)

(assert (=> b!448691 m!432619))

(declare-fun m!432621 () Bool)

(assert (=> b!448689 m!432621))

(declare-fun m!432623 () Bool)

(assert (=> b!448684 m!432623))

(declare-fun m!432625 () Bool)

(assert (=> b!448684 m!432625))

(declare-fun m!432627 () Bool)

(assert (=> b!448684 m!432627))

(declare-fun m!432629 () Bool)

(assert (=> b!448695 m!432629))

(check-sat (not b!448684) (not b!448681) (not b!448686) (not b_next!10657) (not b!448694) (not b!448693) tp_is_empty!11995 (not mapNonEmpty!19626) (not start!40632) b_and!18639 (not b!448689) (not b!448682) (not b!448695))
(check-sat b_and!18639 (not b_next!10657))
