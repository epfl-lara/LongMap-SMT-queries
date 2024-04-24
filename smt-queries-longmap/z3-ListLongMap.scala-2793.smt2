; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40632 () Bool)

(assert start!40632)

(declare-fun b_free!10657 () Bool)

(declare-fun b_next!10657 () Bool)

(assert (=> start!40632 (= b_free!10657 (not b_next!10657))))

(declare-fun tp!37791 () Bool)

(declare-fun b_and!18679 () Bool)

(assert (=> start!40632 (= tp!37791 b_and!18679)))

(declare-fun b!448903 () Bool)

(declare-fun res!266941 () Bool)

(declare-fun e!263303 () Bool)

(assert (=> b!448903 (=> (not res!266941) (not e!263303))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448903 (= res!266941 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19626 () Bool)

(declare-fun mapRes!19626 () Bool)

(declare-fun tp!37790 () Bool)

(declare-fun e!263304 () Bool)

(assert (=> mapNonEmpty!19626 (= mapRes!19626 (and tp!37790 e!263304))))

(declare-fun mapKey!19626 () (_ BitVec 32))

(declare-datatypes ((V!17099 0))(
  ( (V!17100 (val!6042 Int)) )
))
(declare-datatypes ((ValueCell!5654 0))(
  ( (ValueCellFull!5654 (v!8298 V!17099)) (EmptyCell!5654) )
))
(declare-datatypes ((array!27792 0))(
  ( (array!27793 (arr!13341 (Array (_ BitVec 32) ValueCell!5654)) (size!13693 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27792)

(declare-fun mapRest!19626 () (Array (_ BitVec 32) ValueCell!5654))

(declare-fun mapValue!19626 () ValueCell!5654)

(assert (=> mapNonEmpty!19626 (= (arr!13341 _values!549) (store mapRest!19626 mapKey!19626 mapValue!19626))))

(declare-fun b!448904 () Bool)

(declare-fun res!266952 () Bool)

(assert (=> b!448904 (=> (not res!266952) (not e!263303))))

(declare-datatypes ((array!27794 0))(
  ( (array!27795 (arr!13342 (Array (_ BitVec 32) (_ BitVec 64))) (size!13694 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27794)

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!448904 (= res!266952 (and (= (size!13693 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13694 _keys!709) (size!13693 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448905 () Bool)

(declare-fun res!266945 () Bool)

(declare-fun e!263299 () Bool)

(assert (=> b!448905 (=> (not res!266945) (not e!263299))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448905 (= res!266945 (bvsle from!863 i!563))))

(declare-fun b!448907 () Bool)

(declare-fun res!266942 () Bool)

(assert (=> b!448907 (=> (not res!266942) (not e!263303))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448907 (= res!266942 (validKeyInArray!0 k0!794))))

(declare-fun b!448908 () Bool)

(assert (=> b!448908 (= e!263303 e!263299)))

(declare-fun res!266947 () Bool)

(assert (=> b!448908 (=> (not res!266947) (not e!263299))))

(declare-fun lt!204289 () array!27794)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27794 (_ BitVec 32)) Bool)

(assert (=> b!448908 (= res!266947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204289 mask!1025))))

(assert (=> b!448908 (= lt!204289 (array!27795 (store (arr!13342 _keys!709) i!563 k0!794) (size!13694 _keys!709)))))

(declare-fun b!448909 () Bool)

(declare-fun res!266946 () Bool)

(assert (=> b!448909 (=> (not res!266946) (not e!263303))))

(declare-fun arrayContainsKey!0 (array!27794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448909 (= res!266946 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448910 () Bool)

(declare-fun res!266944 () Bool)

(assert (=> b!448910 (=> (not res!266944) (not e!263303))))

(declare-datatypes ((List!7906 0))(
  ( (Nil!7903) (Cons!7902 (h!8758 (_ BitVec 64)) (t!13660 List!7906)) )
))
(declare-fun arrayNoDuplicates!0 (array!27794 (_ BitVec 32) List!7906) Bool)

(assert (=> b!448910 (= res!266944 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7903))))

(declare-fun b!448911 () Bool)

(declare-fun res!266948 () Bool)

(assert (=> b!448911 (=> (not res!266948) (not e!263303))))

(assert (=> b!448911 (= res!266948 (or (= (select (arr!13342 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13342 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448912 () Bool)

(declare-fun e!263302 () Bool)

(declare-fun tp_is_empty!11995 () Bool)

(assert (=> b!448912 (= e!263302 tp_is_empty!11995)))

(declare-fun b!448913 () Bool)

(assert (=> b!448913 (= e!263304 tp_is_empty!11995)))

(declare-fun b!448914 () Bool)

(assert (=> b!448914 (= e!263299 false)))

(declare-fun minValue!515 () V!17099)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7834 0))(
  ( (tuple2!7835 (_1!3928 (_ BitVec 64)) (_2!3928 V!17099)) )
))
(declare-datatypes ((List!7907 0))(
  ( (Nil!7904) (Cons!7903 (h!8759 tuple2!7834) (t!13661 List!7907)) )
))
(declare-datatypes ((ListLongMap!6749 0))(
  ( (ListLongMap!6750 (toList!3390 List!7907)) )
))
(declare-fun lt!204287 () ListLongMap!6749)

(declare-fun v!412 () V!17099)

(declare-fun zeroValue!515 () V!17099)

(declare-fun getCurrentListMapNoExtraKeys!1620 (array!27794 array!27792 (_ BitVec 32) (_ BitVec 32) V!17099 V!17099 (_ BitVec 32) Int) ListLongMap!6749)

(assert (=> b!448914 (= lt!204287 (getCurrentListMapNoExtraKeys!1620 lt!204289 (array!27793 (store (arr!13341 _values!549) i!563 (ValueCellFull!5654 v!412)) (size!13693 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204288 () ListLongMap!6749)

(assert (=> b!448914 (= lt!204288 (getCurrentListMapNoExtraKeys!1620 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!266943 () Bool)

(assert (=> start!40632 (=> (not res!266943) (not e!263303))))

(assert (=> start!40632 (= res!266943 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13694 _keys!709))))))

(assert (=> start!40632 e!263303))

(assert (=> start!40632 tp_is_empty!11995))

(assert (=> start!40632 tp!37791))

(assert (=> start!40632 true))

(declare-fun e!263300 () Bool)

(declare-fun array_inv!9746 (array!27792) Bool)

(assert (=> start!40632 (and (array_inv!9746 _values!549) e!263300)))

(declare-fun array_inv!9747 (array!27794) Bool)

(assert (=> start!40632 (array_inv!9747 _keys!709)))

(declare-fun b!448906 () Bool)

(declare-fun res!266951 () Bool)

(assert (=> b!448906 (=> (not res!266951) (not e!263303))))

(assert (=> b!448906 (= res!266951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448915 () Bool)

(declare-fun res!266949 () Bool)

(assert (=> b!448915 (=> (not res!266949) (not e!263303))))

(assert (=> b!448915 (= res!266949 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13694 _keys!709))))))

(declare-fun b!448916 () Bool)

(assert (=> b!448916 (= e!263300 (and e!263302 mapRes!19626))))

(declare-fun condMapEmpty!19626 () Bool)

(declare-fun mapDefault!19626 () ValueCell!5654)

(assert (=> b!448916 (= condMapEmpty!19626 (= (arr!13341 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5654)) mapDefault!19626)))))

(declare-fun b!448917 () Bool)

(declare-fun res!266950 () Bool)

(assert (=> b!448917 (=> (not res!266950) (not e!263299))))

(assert (=> b!448917 (= res!266950 (arrayNoDuplicates!0 lt!204289 #b00000000000000000000000000000000 Nil!7903))))

(declare-fun mapIsEmpty!19626 () Bool)

(assert (=> mapIsEmpty!19626 mapRes!19626))

(assert (= (and start!40632 res!266943) b!448903))

(assert (= (and b!448903 res!266941) b!448904))

(assert (= (and b!448904 res!266952) b!448906))

(assert (= (and b!448906 res!266951) b!448910))

(assert (= (and b!448910 res!266944) b!448915))

(assert (= (and b!448915 res!266949) b!448907))

(assert (= (and b!448907 res!266942) b!448911))

(assert (= (and b!448911 res!266948) b!448909))

(assert (= (and b!448909 res!266946) b!448908))

(assert (= (and b!448908 res!266947) b!448917))

(assert (= (and b!448917 res!266950) b!448905))

(assert (= (and b!448905 res!266945) b!448914))

(assert (= (and b!448916 condMapEmpty!19626) mapIsEmpty!19626))

(assert (= (and b!448916 (not condMapEmpty!19626)) mapNonEmpty!19626))

(get-info :version)

(assert (= (and mapNonEmpty!19626 ((_ is ValueCellFull!5654) mapValue!19626)) b!448913))

(assert (= (and b!448916 ((_ is ValueCellFull!5654) mapDefault!19626)) b!448912))

(assert (= start!40632 b!448916))

(declare-fun m!433551 () Bool)

(assert (=> b!448903 m!433551))

(declare-fun m!433553 () Bool)

(assert (=> b!448907 m!433553))

(declare-fun m!433555 () Bool)

(assert (=> b!448914 m!433555))

(declare-fun m!433557 () Bool)

(assert (=> b!448914 m!433557))

(declare-fun m!433559 () Bool)

(assert (=> b!448914 m!433559))

(declare-fun m!433561 () Bool)

(assert (=> b!448908 m!433561))

(declare-fun m!433563 () Bool)

(assert (=> b!448908 m!433563))

(declare-fun m!433565 () Bool)

(assert (=> b!448910 m!433565))

(declare-fun m!433567 () Bool)

(assert (=> mapNonEmpty!19626 m!433567))

(declare-fun m!433569 () Bool)

(assert (=> b!448917 m!433569))

(declare-fun m!433571 () Bool)

(assert (=> b!448911 m!433571))

(declare-fun m!433573 () Bool)

(assert (=> b!448906 m!433573))

(declare-fun m!433575 () Bool)

(assert (=> b!448909 m!433575))

(declare-fun m!433577 () Bool)

(assert (=> start!40632 m!433577))

(declare-fun m!433579 () Bool)

(assert (=> start!40632 m!433579))

(check-sat (not mapNonEmpty!19626) (not b!448917) (not b!448907) (not b!448909) (not b!448903) tp_is_empty!11995 (not start!40632) b_and!18679 (not b!448906) (not b!448908) (not b!448914) (not b_next!10657) (not b!448910))
(check-sat b_and!18679 (not b_next!10657))
