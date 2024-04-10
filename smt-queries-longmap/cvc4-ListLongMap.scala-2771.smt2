; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40482 () Bool)

(assert start!40482)

(declare-fun b_free!10553 () Bool)

(declare-fun b_next!10553 () Bool)

(assert (=> start!40482 (= b_free!10553 (not b_next!10553))))

(declare-fun tp!37436 () Bool)

(declare-fun b_and!18537 () Bool)

(assert (=> start!40482 (= tp!37436 b_and!18537)))

(declare-fun b!445858 () Bool)

(declare-fun e!262001 () Bool)

(assert (=> b!445858 (= e!262001 (not true))))

(declare-fun e!262006 () Bool)

(assert (=> b!445858 e!262006))

(declare-fun c!55875 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445858 (= c!55875 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16927 0))(
  ( (V!16928 (val!5978 Int)) )
))
(declare-datatypes ((ValueCell!5590 0))(
  ( (ValueCellFull!5590 (v!8229 V!16927)) (EmptyCell!5590) )
))
(declare-datatypes ((array!27541 0))(
  ( (array!27542 (arr!13218 (Array (_ BitVec 32) ValueCell!5590)) (size!13570 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27541)

(declare-fun zeroValue!515 () V!16927)

(declare-fun v!412 () V!16927)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27543 0))(
  ( (array!27544 (arr!13219 (Array (_ BitVec 32) (_ BitVec 64))) (size!13571 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27543)

(declare-fun minValue!515 () V!16927)

(declare-datatypes ((Unit!13170 0))(
  ( (Unit!13171) )
))
(declare-fun lt!203683 () Unit!13170)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!701 (array!27543 array!27541 (_ BitVec 32) (_ BitVec 32) V!16927 V!16927 (_ BitVec 32) (_ BitVec 64) V!16927 (_ BitVec 32) Int) Unit!13170)

(assert (=> b!445858 (= lt!203683 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!701 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445859 () Bool)

(declare-fun e!262002 () Bool)

(assert (=> b!445859 (= e!262002 e!262001)))

(declare-fun res!264610 () Bool)

(assert (=> b!445859 (=> (not res!264610) (not e!262001))))

(declare-fun lt!203684 () array!27543)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27543 (_ BitVec 32)) Bool)

(assert (=> b!445859 (= res!264610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203684 mask!1025))))

(assert (=> b!445859 (= lt!203684 (array!27544 (store (arr!13219 _keys!709) i!563 k!794) (size!13571 _keys!709)))))

(declare-fun bm!29612 () Bool)

(declare-datatypes ((tuple2!7854 0))(
  ( (tuple2!7855 (_1!3938 (_ BitVec 64)) (_2!3938 V!16927)) )
))
(declare-datatypes ((List!7905 0))(
  ( (Nil!7902) (Cons!7901 (h!8757 tuple2!7854) (t!13663 List!7905)) )
))
(declare-datatypes ((ListLongMap!6767 0))(
  ( (ListLongMap!6768 (toList!3399 List!7905)) )
))
(declare-fun call!29616 () ListLongMap!6767)

(declare-fun getCurrentListMapNoExtraKeys!1586 (array!27543 array!27541 (_ BitVec 32) (_ BitVec 32) V!16927 V!16927 (_ BitVec 32) Int) ListLongMap!6767)

(assert (=> bm!29612 (= call!29616 (getCurrentListMapNoExtraKeys!1586 (ite c!55875 lt!203684 _keys!709) (ite c!55875 (array!27542 (store (arr!13218 _values!549) i!563 (ValueCellFull!5590 v!412)) (size!13570 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445860 () Bool)

(declare-fun call!29615 () ListLongMap!6767)

(assert (=> b!445860 (= e!262006 (= call!29615 call!29616))))

(declare-fun res!264603 () Bool)

(assert (=> start!40482 (=> (not res!264603) (not e!262002))))

(assert (=> start!40482 (= res!264603 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13571 _keys!709))))))

(assert (=> start!40482 e!262002))

(declare-fun tp_is_empty!11867 () Bool)

(assert (=> start!40482 tp_is_empty!11867))

(assert (=> start!40482 tp!37436))

(assert (=> start!40482 true))

(declare-fun e!262005 () Bool)

(declare-fun array_inv!9586 (array!27541) Bool)

(assert (=> start!40482 (and (array_inv!9586 _values!549) e!262005)))

(declare-fun array_inv!9587 (array!27543) Bool)

(assert (=> start!40482 (array_inv!9587 _keys!709)))

(declare-fun b!445861 () Bool)

(declare-fun res!264604 () Bool)

(assert (=> b!445861 (=> (not res!264604) (not e!262002))))

(assert (=> b!445861 (= res!264604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445862 () Bool)

(declare-fun e!262003 () Bool)

(assert (=> b!445862 (= e!262003 tp_is_empty!11867)))

(declare-fun b!445863 () Bool)

(declare-fun +!1530 (ListLongMap!6767 tuple2!7854) ListLongMap!6767)

(assert (=> b!445863 (= e!262006 (= call!29616 (+!1530 call!29615 (tuple2!7855 k!794 v!412))))))

(declare-fun b!445864 () Bool)

(declare-fun res!264605 () Bool)

(assert (=> b!445864 (=> (not res!264605) (not e!262001))))

(declare-datatypes ((List!7906 0))(
  ( (Nil!7903) (Cons!7902 (h!8758 (_ BitVec 64)) (t!13664 List!7906)) )
))
(declare-fun arrayNoDuplicates!0 (array!27543 (_ BitVec 32) List!7906) Bool)

(assert (=> b!445864 (= res!264605 (arrayNoDuplicates!0 lt!203684 #b00000000000000000000000000000000 Nil!7903))))

(declare-fun b!445865 () Bool)

(declare-fun res!264602 () Bool)

(assert (=> b!445865 (=> (not res!264602) (not e!262002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445865 (= res!264602 (validKeyInArray!0 k!794))))

(declare-fun b!445866 () Bool)

(declare-fun res!264613 () Bool)

(assert (=> b!445866 (=> (not res!264613) (not e!262002))))

(assert (=> b!445866 (= res!264613 (or (= (select (arr!13219 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13219 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445867 () Bool)

(declare-fun res!264606 () Bool)

(assert (=> b!445867 (=> (not res!264606) (not e!262002))))

(assert (=> b!445867 (= res!264606 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7903))))

(declare-fun b!445868 () Bool)

(declare-fun res!264608 () Bool)

(assert (=> b!445868 (=> (not res!264608) (not e!262002))))

(declare-fun arrayContainsKey!0 (array!27543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445868 (= res!264608 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19428 () Bool)

(declare-fun mapRes!19428 () Bool)

(declare-fun tp!37437 () Bool)

(assert (=> mapNonEmpty!19428 (= mapRes!19428 (and tp!37437 e!262003))))

(declare-fun mapKey!19428 () (_ BitVec 32))

(declare-fun mapRest!19428 () (Array (_ BitVec 32) ValueCell!5590))

(declare-fun mapValue!19428 () ValueCell!5590)

(assert (=> mapNonEmpty!19428 (= (arr!13218 _values!549) (store mapRest!19428 mapKey!19428 mapValue!19428))))

(declare-fun b!445869 () Bool)

(declare-fun res!264609 () Bool)

(assert (=> b!445869 (=> (not res!264609) (not e!262002))))

(assert (=> b!445869 (= res!264609 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13571 _keys!709))))))

(declare-fun mapIsEmpty!19428 () Bool)

(assert (=> mapIsEmpty!19428 mapRes!19428))

(declare-fun bm!29613 () Bool)

(assert (=> bm!29613 (= call!29615 (getCurrentListMapNoExtraKeys!1586 (ite c!55875 _keys!709 lt!203684) (ite c!55875 _values!549 (array!27542 (store (arr!13218 _values!549) i!563 (ValueCellFull!5590 v!412)) (size!13570 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445870 () Bool)

(declare-fun res!264607 () Bool)

(assert (=> b!445870 (=> (not res!264607) (not e!262001))))

(assert (=> b!445870 (= res!264607 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13571 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445871 () Bool)

(declare-fun res!264612 () Bool)

(assert (=> b!445871 (=> (not res!264612) (not e!262002))))

(assert (=> b!445871 (= res!264612 (and (= (size!13570 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13571 _keys!709) (size!13570 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445872 () Bool)

(declare-fun e!262007 () Bool)

(assert (=> b!445872 (= e!262005 (and e!262007 mapRes!19428))))

(declare-fun condMapEmpty!19428 () Bool)

(declare-fun mapDefault!19428 () ValueCell!5590)

