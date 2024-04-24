; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40584 () Bool)

(assert start!40584)

(declare-fun b_free!10609 () Bool)

(declare-fun b_next!10609 () Bool)

(assert (=> start!40584 (= b_free!10609 (not b_next!10609))))

(declare-fun tp!37646 () Bool)

(declare-fun b_and!18631 () Bool)

(assert (=> start!40584 (= tp!37646 b_and!18631)))

(declare-fun b!447823 () Bool)

(declare-fun res!266081 () Bool)

(declare-fun e!262871 () Bool)

(assert (=> b!447823 (=> (not res!266081) (not e!262871))))

(declare-datatypes ((array!27702 0))(
  ( (array!27703 (arr!13296 (Array (_ BitVec 32) (_ BitVec 64))) (size!13648 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27702)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447823 (= res!266081 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447824 () Bool)

(declare-fun e!262868 () Bool)

(declare-fun tp_is_empty!11947 () Bool)

(assert (=> b!447824 (= e!262868 tp_is_empty!11947)))

(declare-fun res!266080 () Bool)

(assert (=> start!40584 (=> (not res!266080) (not e!262871))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40584 (= res!266080 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13648 _keys!709))))))

(assert (=> start!40584 e!262871))

(assert (=> start!40584 tp_is_empty!11947))

(assert (=> start!40584 tp!37646))

(assert (=> start!40584 true))

(declare-datatypes ((V!17035 0))(
  ( (V!17036 (val!6018 Int)) )
))
(declare-datatypes ((ValueCell!5630 0))(
  ( (ValueCellFull!5630 (v!8274 V!17035)) (EmptyCell!5630) )
))
(declare-datatypes ((array!27704 0))(
  ( (array!27705 (arr!13297 (Array (_ BitVec 32) ValueCell!5630)) (size!13649 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27704)

(declare-fun e!262869 () Bool)

(declare-fun array_inv!9716 (array!27704) Bool)

(assert (=> start!40584 (and (array_inv!9716 _values!549) e!262869)))

(declare-fun array_inv!9717 (array!27702) Bool)

(assert (=> start!40584 (array_inv!9717 _keys!709)))

(declare-fun b!447825 () Bool)

(declare-fun res!266077 () Bool)

(assert (=> b!447825 (=> (not res!266077) (not e!262871))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447825 (= res!266077 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13648 _keys!709))))))

(declare-fun b!447826 () Bool)

(declare-fun e!262870 () Bool)

(assert (=> b!447826 (= e!262871 e!262870)))

(declare-fun res!266088 () Bool)

(assert (=> b!447826 (=> (not res!266088) (not e!262870))))

(declare-fun lt!204073 () array!27702)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27702 (_ BitVec 32)) Bool)

(assert (=> b!447826 (= res!266088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204073 mask!1025))))

(assert (=> b!447826 (= lt!204073 (array!27703 (store (arr!13296 _keys!709) i!563 k0!794) (size!13648 _keys!709)))))

(declare-fun b!447827 () Bool)

(declare-fun res!266087 () Bool)

(assert (=> b!447827 (=> (not res!266087) (not e!262870))))

(assert (=> b!447827 (= res!266087 (bvsle from!863 i!563))))

(declare-fun b!447828 () Bool)

(declare-fun res!266086 () Bool)

(assert (=> b!447828 (=> (not res!266086) (not e!262871))))

(declare-datatypes ((List!7871 0))(
  ( (Nil!7868) (Cons!7867 (h!8723 (_ BitVec 64)) (t!13625 List!7871)) )
))
(declare-fun arrayNoDuplicates!0 (array!27702 (_ BitVec 32) List!7871) Bool)

(assert (=> b!447828 (= res!266086 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7868))))

(declare-fun b!447829 () Bool)

(declare-fun res!266078 () Bool)

(assert (=> b!447829 (=> (not res!266078) (not e!262871))))

(assert (=> b!447829 (= res!266078 (or (= (select (arr!13296 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13296 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19554 () Bool)

(declare-fun mapRes!19554 () Bool)

(assert (=> mapIsEmpty!19554 mapRes!19554))

(declare-fun b!447830 () Bool)

(declare-fun res!266082 () Bool)

(assert (=> b!447830 (=> (not res!266082) (not e!262871))))

(assert (=> b!447830 (= res!266082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447831 () Bool)

(assert (=> b!447831 (= e!262870 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17035)

(declare-fun v!412 () V!17035)

(declare-datatypes ((tuple2!7800 0))(
  ( (tuple2!7801 (_1!3911 (_ BitVec 64)) (_2!3911 V!17035)) )
))
(declare-datatypes ((List!7872 0))(
  ( (Nil!7869) (Cons!7868 (h!8724 tuple2!7800) (t!13626 List!7872)) )
))
(declare-datatypes ((ListLongMap!6715 0))(
  ( (ListLongMap!6716 (toList!3373 List!7872)) )
))
(declare-fun lt!204071 () ListLongMap!6715)

(declare-fun minValue!515 () V!17035)

(declare-fun getCurrentListMapNoExtraKeys!1603 (array!27702 array!27704 (_ BitVec 32) (_ BitVec 32) V!17035 V!17035 (_ BitVec 32) Int) ListLongMap!6715)

(assert (=> b!447831 (= lt!204071 (getCurrentListMapNoExtraKeys!1603 lt!204073 (array!27705 (store (arr!13297 _values!549) i!563 (ValueCellFull!5630 v!412)) (size!13649 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204072 () ListLongMap!6715)

(assert (=> b!447831 (= lt!204072 (getCurrentListMapNoExtraKeys!1603 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447832 () Bool)

(declare-fun res!266079 () Bool)

(assert (=> b!447832 (=> (not res!266079) (not e!262871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447832 (= res!266079 (validKeyInArray!0 k0!794))))

(declare-fun b!447833 () Bool)

(declare-fun res!266085 () Bool)

(assert (=> b!447833 (=> (not res!266085) (not e!262871))))

(assert (=> b!447833 (= res!266085 (and (= (size!13649 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13648 _keys!709) (size!13649 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19554 () Bool)

(declare-fun tp!37647 () Bool)

(assert (=> mapNonEmpty!19554 (= mapRes!19554 (and tp!37647 e!262868))))

(declare-fun mapValue!19554 () ValueCell!5630)

(declare-fun mapRest!19554 () (Array (_ BitVec 32) ValueCell!5630))

(declare-fun mapKey!19554 () (_ BitVec 32))

(assert (=> mapNonEmpty!19554 (= (arr!13297 _values!549) (store mapRest!19554 mapKey!19554 mapValue!19554))))

(declare-fun b!447834 () Bool)

(declare-fun res!266084 () Bool)

(assert (=> b!447834 (=> (not res!266084) (not e!262871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447834 (= res!266084 (validMask!0 mask!1025))))

(declare-fun b!447835 () Bool)

(declare-fun e!262872 () Bool)

(assert (=> b!447835 (= e!262872 tp_is_empty!11947)))

(declare-fun b!447836 () Bool)

(declare-fun res!266083 () Bool)

(assert (=> b!447836 (=> (not res!266083) (not e!262870))))

(assert (=> b!447836 (= res!266083 (arrayNoDuplicates!0 lt!204073 #b00000000000000000000000000000000 Nil!7868))))

(declare-fun b!447837 () Bool)

(assert (=> b!447837 (= e!262869 (and e!262872 mapRes!19554))))

(declare-fun condMapEmpty!19554 () Bool)

(declare-fun mapDefault!19554 () ValueCell!5630)

(assert (=> b!447837 (= condMapEmpty!19554 (= (arr!13297 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5630)) mapDefault!19554)))))

(assert (= (and start!40584 res!266080) b!447834))

(assert (= (and b!447834 res!266084) b!447833))

(assert (= (and b!447833 res!266085) b!447830))

(assert (= (and b!447830 res!266082) b!447828))

(assert (= (and b!447828 res!266086) b!447825))

(assert (= (and b!447825 res!266077) b!447832))

(assert (= (and b!447832 res!266079) b!447829))

(assert (= (and b!447829 res!266078) b!447823))

(assert (= (and b!447823 res!266081) b!447826))

(assert (= (and b!447826 res!266088) b!447836))

(assert (= (and b!447836 res!266083) b!447827))

(assert (= (and b!447827 res!266087) b!447831))

(assert (= (and b!447837 condMapEmpty!19554) mapIsEmpty!19554))

(assert (= (and b!447837 (not condMapEmpty!19554)) mapNonEmpty!19554))

(get-info :version)

(assert (= (and mapNonEmpty!19554 ((_ is ValueCellFull!5630) mapValue!19554)) b!447824))

(assert (= (and b!447837 ((_ is ValueCellFull!5630) mapDefault!19554)) b!447835))

(assert (= start!40584 b!447837))

(declare-fun m!432831 () Bool)

(assert (=> b!447828 m!432831))

(declare-fun m!432833 () Bool)

(assert (=> b!447823 m!432833))

(declare-fun m!432835 () Bool)

(assert (=> mapNonEmpty!19554 m!432835))

(declare-fun m!432837 () Bool)

(assert (=> b!447832 m!432837))

(declare-fun m!432839 () Bool)

(assert (=> b!447836 m!432839))

(declare-fun m!432841 () Bool)

(assert (=> start!40584 m!432841))

(declare-fun m!432843 () Bool)

(assert (=> start!40584 m!432843))

(declare-fun m!432845 () Bool)

(assert (=> b!447826 m!432845))

(declare-fun m!432847 () Bool)

(assert (=> b!447826 m!432847))

(declare-fun m!432849 () Bool)

(assert (=> b!447834 m!432849))

(declare-fun m!432851 () Bool)

(assert (=> b!447830 m!432851))

(declare-fun m!432853 () Bool)

(assert (=> b!447829 m!432853))

(declare-fun m!432855 () Bool)

(assert (=> b!447831 m!432855))

(declare-fun m!432857 () Bool)

(assert (=> b!447831 m!432857))

(declare-fun m!432859 () Bool)

(assert (=> b!447831 m!432859))

(check-sat (not b!447831) (not mapNonEmpty!19554) (not start!40584) (not b!447832) (not b!447828) (not b!447836) (not b!447826) (not b!447834) tp_is_empty!11947 (not b!447823) b_and!18631 (not b!447830) (not b_next!10609))
(check-sat b_and!18631 (not b_next!10609))
