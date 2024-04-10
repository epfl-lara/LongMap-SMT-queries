; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40594 () Bool)

(assert start!40594)

(declare-fun b_free!10605 () Bool)

(declare-fun b_next!10605 () Bool)

(assert (=> start!40594 (= b_free!10605 (not b_next!10605))))

(declare-fun tp!37635 () Bool)

(declare-fun b_and!18613 () Bool)

(assert (=> start!40594 (= tp!37635 b_and!18613)))

(declare-fun b!447782 () Bool)

(declare-fun res!266013 () Bool)

(declare-fun e!262867 () Bool)

(assert (=> b!447782 (=> (not res!266013) (not e!262867))))

(declare-datatypes ((array!27693 0))(
  ( (array!27694 (arr!13292 (Array (_ BitVec 32) (_ BitVec 64))) (size!13644 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27693)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27693 (_ BitVec 32)) Bool)

(assert (=> b!447782 (= res!266013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447783 () Bool)

(declare-fun res!266015 () Bool)

(assert (=> b!447783 (=> (not res!266015) (not e!262867))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447783 (= res!266015 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13644 _keys!709))))))

(declare-fun b!447784 () Bool)

(declare-fun res!266018 () Bool)

(declare-fun e!262866 () Bool)

(assert (=> b!447784 (=> (not res!266018) (not e!262866))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!447784 (= res!266018 (bvsle from!863 i!563))))

(declare-fun b!447785 () Bool)

(declare-fun res!266009 () Bool)

(assert (=> b!447785 (=> (not res!266009) (not e!262867))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447785 (= res!266009 (validKeyInArray!0 k0!794))))

(declare-fun b!447786 () Bool)

(declare-fun e!262863 () Bool)

(declare-fun tp_is_empty!11943 () Bool)

(assert (=> b!447786 (= e!262863 tp_is_empty!11943)))

(declare-fun res!266016 () Bool)

(assert (=> start!40594 (=> (not res!266016) (not e!262867))))

(assert (=> start!40594 (= res!266016 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13644 _keys!709))))))

(assert (=> start!40594 e!262867))

(assert (=> start!40594 tp_is_empty!11943))

(assert (=> start!40594 tp!37635))

(assert (=> start!40594 true))

(declare-datatypes ((V!17029 0))(
  ( (V!17030 (val!6016 Int)) )
))
(declare-datatypes ((ValueCell!5628 0))(
  ( (ValueCellFull!5628 (v!8271 V!17029)) (EmptyCell!5628) )
))
(declare-datatypes ((array!27695 0))(
  ( (array!27696 (arr!13293 (Array (_ BitVec 32) ValueCell!5628)) (size!13645 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27695)

(declare-fun e!262864 () Bool)

(declare-fun array_inv!9634 (array!27695) Bool)

(assert (=> start!40594 (and (array_inv!9634 _values!549) e!262864)))

(declare-fun array_inv!9635 (array!27693) Bool)

(assert (=> start!40594 (array_inv!9635 _keys!709)))

(declare-fun mapNonEmpty!19548 () Bool)

(declare-fun mapRes!19548 () Bool)

(declare-fun tp!37634 () Bool)

(declare-fun e!262868 () Bool)

(assert (=> mapNonEmpty!19548 (= mapRes!19548 (and tp!37634 e!262868))))

(declare-fun mapRest!19548 () (Array (_ BitVec 32) ValueCell!5628))

(declare-fun mapValue!19548 () ValueCell!5628)

(declare-fun mapKey!19548 () (_ BitVec 32))

(assert (=> mapNonEmpty!19548 (= (arr!13293 _values!549) (store mapRest!19548 mapKey!19548 mapValue!19548))))

(declare-fun b!447787 () Bool)

(declare-fun res!266008 () Bool)

(assert (=> b!447787 (=> (not res!266008) (not e!262867))))

(declare-fun arrayContainsKey!0 (array!27693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447787 (= res!266008 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447788 () Bool)

(assert (=> b!447788 (= e!262868 tp_is_empty!11943)))

(declare-fun b!447789 () Bool)

(assert (=> b!447789 (= e!262864 (and e!262863 mapRes!19548))))

(declare-fun condMapEmpty!19548 () Bool)

(declare-fun mapDefault!19548 () ValueCell!5628)

(assert (=> b!447789 (= condMapEmpty!19548 (= (arr!13293 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5628)) mapDefault!19548)))))

(declare-fun b!447790 () Bool)

(declare-fun res!266014 () Bool)

(assert (=> b!447790 (=> (not res!266014) (not e!262867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447790 (= res!266014 (validMask!0 mask!1025))))

(declare-fun b!447791 () Bool)

(declare-fun res!266019 () Bool)

(assert (=> b!447791 (=> (not res!266019) (not e!262867))))

(declare-datatypes ((List!7955 0))(
  ( (Nil!7952) (Cons!7951 (h!8807 (_ BitVec 64)) (t!13717 List!7955)) )
))
(declare-fun arrayNoDuplicates!0 (array!27693 (_ BitVec 32) List!7955) Bool)

(assert (=> b!447791 (= res!266019 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7952))))

(declare-fun b!447792 () Bool)

(declare-fun res!266012 () Bool)

(assert (=> b!447792 (=> (not res!266012) (not e!262867))))

(assert (=> b!447792 (= res!266012 (or (= (select (arr!13292 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13292 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19548 () Bool)

(assert (=> mapIsEmpty!19548 mapRes!19548))

(declare-fun b!447793 () Bool)

(assert (=> b!447793 (= e!262867 e!262866)))

(declare-fun res!266011 () Bool)

(assert (=> b!447793 (=> (not res!266011) (not e!262866))))

(declare-fun lt!204034 () array!27693)

(assert (=> b!447793 (= res!266011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204034 mask!1025))))

(assert (=> b!447793 (= lt!204034 (array!27694 (store (arr!13292 _keys!709) i!563 k0!794) (size!13644 _keys!709)))))

(declare-fun b!447794 () Bool)

(declare-fun res!266010 () Bool)

(assert (=> b!447794 (=> (not res!266010) (not e!262867))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!447794 (= res!266010 (and (= (size!13645 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13644 _keys!709) (size!13645 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447795 () Bool)

(declare-fun res!266017 () Bool)

(assert (=> b!447795 (=> (not res!266017) (not e!262866))))

(assert (=> b!447795 (= res!266017 (arrayNoDuplicates!0 lt!204034 #b00000000000000000000000000000000 Nil!7952))))

(declare-fun b!447796 () Bool)

(assert (=> b!447796 (= e!262866 false)))

(declare-datatypes ((tuple2!7890 0))(
  ( (tuple2!7891 (_1!3956 (_ BitVec 64)) (_2!3956 V!17029)) )
))
(declare-datatypes ((List!7956 0))(
  ( (Nil!7953) (Cons!7952 (h!8808 tuple2!7890) (t!13718 List!7956)) )
))
(declare-datatypes ((ListLongMap!6803 0))(
  ( (ListLongMap!6804 (toList!3417 List!7956)) )
))
(declare-fun lt!204035 () ListLongMap!6803)

(declare-fun minValue!515 () V!17029)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17029)

(declare-fun v!412 () V!17029)

(declare-fun getCurrentListMapNoExtraKeys!1603 (array!27693 array!27695 (_ BitVec 32) (_ BitVec 32) V!17029 V!17029 (_ BitVec 32) Int) ListLongMap!6803)

(assert (=> b!447796 (= lt!204035 (getCurrentListMapNoExtraKeys!1603 lt!204034 (array!27696 (store (arr!13293 _values!549) i!563 (ValueCellFull!5628 v!412)) (size!13645 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204036 () ListLongMap!6803)

(assert (=> b!447796 (= lt!204036 (getCurrentListMapNoExtraKeys!1603 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40594 res!266016) b!447790))

(assert (= (and b!447790 res!266014) b!447794))

(assert (= (and b!447794 res!266010) b!447782))

(assert (= (and b!447782 res!266013) b!447791))

(assert (= (and b!447791 res!266019) b!447783))

(assert (= (and b!447783 res!266015) b!447785))

(assert (= (and b!447785 res!266009) b!447792))

(assert (= (and b!447792 res!266012) b!447787))

(assert (= (and b!447787 res!266008) b!447793))

(assert (= (and b!447793 res!266011) b!447795))

(assert (= (and b!447795 res!266017) b!447784))

(assert (= (and b!447784 res!266018) b!447796))

(assert (= (and b!447789 condMapEmpty!19548) mapIsEmpty!19548))

(assert (= (and b!447789 (not condMapEmpty!19548)) mapNonEmpty!19548))

(get-info :version)

(assert (= (and mapNonEmpty!19548 ((_ is ValueCellFull!5628) mapValue!19548)) b!447788))

(assert (= (and b!447789 ((_ is ValueCellFull!5628) mapDefault!19548)) b!447786))

(assert (= start!40594 b!447789))

(declare-fun m!432553 () Bool)

(assert (=> b!447790 m!432553))

(declare-fun m!432555 () Bool)

(assert (=> b!447787 m!432555))

(declare-fun m!432557 () Bool)

(assert (=> mapNonEmpty!19548 m!432557))

(declare-fun m!432559 () Bool)

(assert (=> b!447782 m!432559))

(declare-fun m!432561 () Bool)

(assert (=> b!447796 m!432561))

(declare-fun m!432563 () Bool)

(assert (=> b!447796 m!432563))

(declare-fun m!432565 () Bool)

(assert (=> b!447796 m!432565))

(declare-fun m!432567 () Bool)

(assert (=> b!447785 m!432567))

(declare-fun m!432569 () Bool)

(assert (=> b!447791 m!432569))

(declare-fun m!432571 () Bool)

(assert (=> start!40594 m!432571))

(declare-fun m!432573 () Bool)

(assert (=> start!40594 m!432573))

(declare-fun m!432575 () Bool)

(assert (=> b!447792 m!432575))

(declare-fun m!432577 () Bool)

(assert (=> b!447793 m!432577))

(declare-fun m!432579 () Bool)

(assert (=> b!447793 m!432579))

(declare-fun m!432581 () Bool)

(assert (=> b!447795 m!432581))

(check-sat (not b!447790) (not b!447793) (not b!447782) b_and!18613 (not mapNonEmpty!19548) (not b!447791) (not b!447785) (not b_next!10605) (not b!447787) (not b!447795) (not start!40594) (not b!447796) tp_is_empty!11943)
(check-sat b_and!18613 (not b_next!10605))
