; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40014 () Bool)

(assert start!40014)

(declare-fun b_free!10281 () Bool)

(declare-fun b_next!10281 () Bool)

(assert (=> start!40014 (= b_free!10281 (not b_next!10281))))

(declare-fun tp!36372 () Bool)

(declare-fun b_and!18221 () Bool)

(assert (=> start!40014 (= tp!36372 b_and!18221)))

(declare-fun mapNonEmpty!18771 () Bool)

(declare-fun mapRes!18771 () Bool)

(declare-fun tp!36371 () Bool)

(declare-fun e!257476 () Bool)

(assert (=> mapNonEmpty!18771 (= mapRes!18771 (and tp!36371 e!257476))))

(declare-datatypes ((V!16349 0))(
  ( (V!16350 (val!5761 Int)) )
))
(declare-datatypes ((ValueCell!5373 0))(
  ( (ValueCellFull!5373 (v!8008 V!16349)) (EmptyCell!5373) )
))
(declare-datatypes ((array!26693 0))(
  ( (array!26694 (arr!12796 (Array (_ BitVec 32) ValueCell!5373)) (size!13148 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26693)

(declare-fun mapKey!18771 () (_ BitVec 32))

(declare-fun mapRest!18771 () (Array (_ BitVec 32) ValueCell!5373))

(declare-fun mapValue!18771 () ValueCell!5373)

(assert (=> mapNonEmpty!18771 (= (arr!12796 _values!549) (store mapRest!18771 mapKey!18771 mapValue!18771))))

(declare-fun b!435912 () Bool)

(declare-fun e!257480 () Bool)

(declare-fun e!257472 () Bool)

(assert (=> b!435912 (= e!257480 e!257472)))

(declare-fun res!256901 () Bool)

(assert (=> b!435912 (=> (not res!256901) (not e!257472))))

(declare-datatypes ((array!26695 0))(
  ( (array!26696 (arr!12797 (Array (_ BitVec 32) (_ BitVec 64))) (size!13149 (_ BitVec 32))) )
))
(declare-fun lt!200826 () array!26695)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26695 (_ BitVec 32)) Bool)

(assert (=> b!435912 (= res!256901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200826 mask!1025))))

(declare-fun _keys!709 () array!26695)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435912 (= lt!200826 (array!26696 (store (arr!12797 _keys!709) i!563 k0!794) (size!13149 _keys!709)))))

(declare-fun res!256893 () Bool)

(assert (=> start!40014 (=> (not res!256893) (not e!257480))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40014 (= res!256893 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13149 _keys!709))))))

(assert (=> start!40014 e!257480))

(declare-fun tp_is_empty!11433 () Bool)

(assert (=> start!40014 tp_is_empty!11433))

(assert (=> start!40014 tp!36372))

(assert (=> start!40014 true))

(declare-fun e!257477 () Bool)

(declare-fun array_inv!9300 (array!26693) Bool)

(assert (=> start!40014 (and (array_inv!9300 _values!549) e!257477)))

(declare-fun array_inv!9301 (array!26695) Bool)

(assert (=> start!40014 (array_inv!9301 _keys!709)))

(declare-fun b!435913 () Bool)

(declare-fun res!256902 () Bool)

(assert (=> b!435913 (=> (not res!256902) (not e!257480))))

(assert (=> b!435913 (= res!256902 (or (= (select (arr!12797 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12797 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435914 () Bool)

(declare-fun res!256899 () Bool)

(assert (=> b!435914 (=> (not res!256899) (not e!257480))))

(assert (=> b!435914 (= res!256899 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13149 _keys!709))))))

(declare-fun mapIsEmpty!18771 () Bool)

(assert (=> mapIsEmpty!18771 mapRes!18771))

(declare-fun b!435915 () Bool)

(declare-fun res!256894 () Bool)

(assert (=> b!435915 (=> (not res!256894) (not e!257480))))

(declare-datatypes ((List!7631 0))(
  ( (Nil!7628) (Cons!7627 (h!8483 (_ BitVec 64)) (t!13361 List!7631)) )
))
(declare-fun arrayNoDuplicates!0 (array!26695 (_ BitVec 32) List!7631) Bool)

(assert (=> b!435915 (= res!256894 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7628))))

(declare-fun b!435916 () Bool)

(declare-datatypes ((Unit!12953 0))(
  ( (Unit!12954) )
))
(declare-fun e!257479 () Unit!12953)

(declare-fun Unit!12955 () Unit!12953)

(assert (=> b!435916 (= e!257479 Unit!12955)))

(declare-fun lt!200827 () Unit!12953)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26695 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12953)

(assert (=> b!435916 (= lt!200827 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435916 false))

(declare-fun b!435917 () Bool)

(assert (=> b!435917 (= e!257476 tp_is_empty!11433)))

(declare-fun b!435918 () Bool)

(declare-fun res!256900 () Bool)

(assert (=> b!435918 (=> (not res!256900) (not e!257480))))

(assert (=> b!435918 (= res!256900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435919 () Bool)

(declare-fun e!257474 () Bool)

(assert (=> b!435919 (= e!257474 true)))

(declare-datatypes ((tuple2!7630 0))(
  ( (tuple2!7631 (_1!3826 (_ BitVec 64)) (_2!3826 V!16349)) )
))
(declare-datatypes ((List!7632 0))(
  ( (Nil!7629) (Cons!7628 (h!8484 tuple2!7630) (t!13362 List!7632)) )
))
(declare-datatypes ((ListLongMap!6543 0))(
  ( (ListLongMap!6544 (toList!3287 List!7632)) )
))
(declare-fun lt!200829 () ListLongMap!6543)

(declare-fun lt!200838 () tuple2!7630)

(declare-fun lt!200828 () ListLongMap!6543)

(declare-fun lt!200834 () tuple2!7630)

(declare-fun +!1435 (ListLongMap!6543 tuple2!7630) ListLongMap!6543)

(assert (=> b!435919 (= lt!200828 (+!1435 (+!1435 lt!200829 lt!200838) lt!200834))))

(declare-fun lt!200837 () V!16349)

(declare-fun v!412 () V!16349)

(declare-fun lt!200830 () Unit!12953)

(declare-fun addCommutativeForDiffKeys!417 (ListLongMap!6543 (_ BitVec 64) V!16349 (_ BitVec 64) V!16349) Unit!12953)

(assert (=> b!435919 (= lt!200830 (addCommutativeForDiffKeys!417 lt!200829 k0!794 v!412 (select (arr!12797 _keys!709) from!863) lt!200837))))

(declare-fun b!435920 () Bool)

(declare-fun res!256898 () Bool)

(assert (=> b!435920 (=> (not res!256898) (not e!257480))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!435920 (= res!256898 (and (= (size!13148 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13149 _keys!709) (size!13148 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435921 () Bool)

(declare-fun res!256895 () Bool)

(assert (=> b!435921 (=> (not res!256895) (not e!257472))))

(assert (=> b!435921 (= res!256895 (bvsle from!863 i!563))))

(declare-fun b!435922 () Bool)

(declare-fun res!256897 () Bool)

(assert (=> b!435922 (=> (not res!256897) (not e!257480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435922 (= res!256897 (validMask!0 mask!1025))))

(declare-fun b!435923 () Bool)

(declare-fun res!256896 () Bool)

(assert (=> b!435923 (=> (not res!256896) (not e!257480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435923 (= res!256896 (validKeyInArray!0 k0!794))))

(declare-fun b!435924 () Bool)

(declare-fun res!256904 () Bool)

(assert (=> b!435924 (=> (not res!256904) (not e!257480))))

(declare-fun arrayContainsKey!0 (array!26695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435924 (= res!256904 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435925 () Bool)

(declare-fun e!257473 () Bool)

(assert (=> b!435925 (= e!257472 e!257473)))

(declare-fun res!256905 () Bool)

(assert (=> b!435925 (=> (not res!256905) (not e!257473))))

(assert (=> b!435925 (= res!256905 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200836 () array!26693)

(declare-fun minValue!515 () V!16349)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16349)

(declare-fun lt!200832 () ListLongMap!6543)

(declare-fun getCurrentListMapNoExtraKeys!1477 (array!26695 array!26693 (_ BitVec 32) (_ BitVec 32) V!16349 V!16349 (_ BitVec 32) Int) ListLongMap!6543)

(assert (=> b!435925 (= lt!200832 (getCurrentListMapNoExtraKeys!1477 lt!200826 lt!200836 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435925 (= lt!200836 (array!26694 (store (arr!12796 _values!549) i!563 (ValueCellFull!5373 v!412)) (size!13148 _values!549)))))

(declare-fun lt!200840 () ListLongMap!6543)

(assert (=> b!435925 (= lt!200840 (getCurrentListMapNoExtraKeys!1477 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435926 () Bool)

(declare-fun e!257475 () Bool)

(assert (=> b!435926 (= e!257475 e!257474)))

(declare-fun res!256891 () Bool)

(assert (=> b!435926 (=> res!256891 e!257474)))

(assert (=> b!435926 (= res!256891 (= k0!794 (select (arr!12797 _keys!709) from!863)))))

(assert (=> b!435926 (not (= (select (arr!12797 _keys!709) from!863) k0!794))))

(declare-fun lt!200835 () Unit!12953)

(assert (=> b!435926 (= lt!200835 e!257479)))

(declare-fun c!55757 () Bool)

(assert (=> b!435926 (= c!55757 (= (select (arr!12797 _keys!709) from!863) k0!794))))

(assert (=> b!435926 (= lt!200832 lt!200828)))

(declare-fun lt!200833 () ListLongMap!6543)

(assert (=> b!435926 (= lt!200828 (+!1435 lt!200833 lt!200838))))

(assert (=> b!435926 (= lt!200838 (tuple2!7631 (select (arr!12797 _keys!709) from!863) lt!200837))))

(declare-fun get!6381 (ValueCell!5373 V!16349) V!16349)

(declare-fun dynLambda!840 (Int (_ BitVec 64)) V!16349)

(assert (=> b!435926 (= lt!200837 (get!6381 (select (arr!12796 _values!549) from!863) (dynLambda!840 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435927 () Bool)

(declare-fun e!257478 () Bool)

(assert (=> b!435927 (= e!257477 (and e!257478 mapRes!18771))))

(declare-fun condMapEmpty!18771 () Bool)

(declare-fun mapDefault!18771 () ValueCell!5373)

(assert (=> b!435927 (= condMapEmpty!18771 (= (arr!12796 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5373)) mapDefault!18771)))))

(declare-fun b!435928 () Bool)

(declare-fun res!256892 () Bool)

(assert (=> b!435928 (=> (not res!256892) (not e!257472))))

(assert (=> b!435928 (= res!256892 (arrayNoDuplicates!0 lt!200826 #b00000000000000000000000000000000 Nil!7628))))

(declare-fun b!435929 () Bool)

(assert (=> b!435929 (= e!257473 (not e!257475))))

(declare-fun res!256903 () Bool)

(assert (=> b!435929 (=> res!256903 e!257475)))

(assert (=> b!435929 (= res!256903 (not (validKeyInArray!0 (select (arr!12797 _keys!709) from!863))))))

(declare-fun lt!200839 () ListLongMap!6543)

(assert (=> b!435929 (= lt!200839 lt!200833)))

(assert (=> b!435929 (= lt!200833 (+!1435 lt!200829 lt!200834))))

(assert (=> b!435929 (= lt!200839 (getCurrentListMapNoExtraKeys!1477 lt!200826 lt!200836 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435929 (= lt!200834 (tuple2!7631 k0!794 v!412))))

(assert (=> b!435929 (= lt!200829 (getCurrentListMapNoExtraKeys!1477 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200831 () Unit!12953)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!606 (array!26695 array!26693 (_ BitVec 32) (_ BitVec 32) V!16349 V!16349 (_ BitVec 32) (_ BitVec 64) V!16349 (_ BitVec 32) Int) Unit!12953)

(assert (=> b!435929 (= lt!200831 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!606 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435930 () Bool)

(declare-fun Unit!12956 () Unit!12953)

(assert (=> b!435930 (= e!257479 Unit!12956)))

(declare-fun b!435931 () Bool)

(assert (=> b!435931 (= e!257478 tp_is_empty!11433)))

(assert (= (and start!40014 res!256893) b!435922))

(assert (= (and b!435922 res!256897) b!435920))

(assert (= (and b!435920 res!256898) b!435918))

(assert (= (and b!435918 res!256900) b!435915))

(assert (= (and b!435915 res!256894) b!435914))

(assert (= (and b!435914 res!256899) b!435923))

(assert (= (and b!435923 res!256896) b!435913))

(assert (= (and b!435913 res!256902) b!435924))

(assert (= (and b!435924 res!256904) b!435912))

(assert (= (and b!435912 res!256901) b!435928))

(assert (= (and b!435928 res!256892) b!435921))

(assert (= (and b!435921 res!256895) b!435925))

(assert (= (and b!435925 res!256905) b!435929))

(assert (= (and b!435929 (not res!256903)) b!435926))

(assert (= (and b!435926 c!55757) b!435916))

(assert (= (and b!435926 (not c!55757)) b!435930))

(assert (= (and b!435926 (not res!256891)) b!435919))

(assert (= (and b!435927 condMapEmpty!18771) mapIsEmpty!18771))

(assert (= (and b!435927 (not condMapEmpty!18771)) mapNonEmpty!18771))

(get-info :version)

(assert (= (and mapNonEmpty!18771 ((_ is ValueCellFull!5373) mapValue!18771)) b!435917))

(assert (= (and b!435927 ((_ is ValueCellFull!5373) mapDefault!18771)) b!435931))

(assert (= start!40014 b!435927))

(declare-fun b_lambda!9369 () Bool)

(assert (=> (not b_lambda!9369) (not b!435926)))

(declare-fun t!13360 () Bool)

(declare-fun tb!3687 () Bool)

(assert (=> (and start!40014 (= defaultEntry!557 defaultEntry!557) t!13360) tb!3687))

(declare-fun result!6901 () Bool)

(assert (=> tb!3687 (= result!6901 tp_is_empty!11433)))

(assert (=> b!435926 t!13360))

(declare-fun b_and!18223 () Bool)

(assert (= b_and!18221 (and (=> t!13360 result!6901) b_and!18223)))

(declare-fun m!423769 () Bool)

(assert (=> start!40014 m!423769))

(declare-fun m!423771 () Bool)

(assert (=> start!40014 m!423771))

(declare-fun m!423773 () Bool)

(assert (=> b!435913 m!423773))

(declare-fun m!423775 () Bool)

(assert (=> b!435919 m!423775))

(assert (=> b!435919 m!423775))

(declare-fun m!423777 () Bool)

(assert (=> b!435919 m!423777))

(declare-fun m!423779 () Bool)

(assert (=> b!435919 m!423779))

(assert (=> b!435919 m!423779))

(declare-fun m!423781 () Bool)

(assert (=> b!435919 m!423781))

(declare-fun m!423783 () Bool)

(assert (=> b!435912 m!423783))

(declare-fun m!423785 () Bool)

(assert (=> b!435912 m!423785))

(declare-fun m!423787 () Bool)

(assert (=> b!435923 m!423787))

(declare-fun m!423789 () Bool)

(assert (=> b!435916 m!423789))

(declare-fun m!423791 () Bool)

(assert (=> b!435928 m!423791))

(declare-fun m!423793 () Bool)

(assert (=> b!435929 m!423793))

(assert (=> b!435929 m!423779))

(declare-fun m!423795 () Bool)

(assert (=> b!435929 m!423795))

(declare-fun m!423797 () Bool)

(assert (=> b!435929 m!423797))

(declare-fun m!423799 () Bool)

(assert (=> b!435929 m!423799))

(assert (=> b!435929 m!423779))

(declare-fun m!423801 () Bool)

(assert (=> b!435929 m!423801))

(declare-fun m!423803 () Bool)

(assert (=> b!435925 m!423803))

(declare-fun m!423805 () Bool)

(assert (=> b!435925 m!423805))

(declare-fun m!423807 () Bool)

(assert (=> b!435925 m!423807))

(declare-fun m!423809 () Bool)

(assert (=> b!435924 m!423809))

(declare-fun m!423811 () Bool)

(assert (=> b!435918 m!423811))

(declare-fun m!423813 () Bool)

(assert (=> b!435922 m!423813))

(assert (=> b!435926 m!423779))

(declare-fun m!423815 () Bool)

(assert (=> b!435926 m!423815))

(assert (=> b!435926 m!423815))

(declare-fun m!423817 () Bool)

(assert (=> b!435926 m!423817))

(declare-fun m!423819 () Bool)

(assert (=> b!435926 m!423819))

(assert (=> b!435926 m!423817))

(declare-fun m!423821 () Bool)

(assert (=> b!435926 m!423821))

(declare-fun m!423823 () Bool)

(assert (=> b!435915 m!423823))

(declare-fun m!423825 () Bool)

(assert (=> mapNonEmpty!18771 m!423825))

(check-sat (not b!435915) (not b!435916) (not b!435918) (not b!435912) (not b!435929) tp_is_empty!11433 (not mapNonEmpty!18771) (not b_next!10281) (not b!435925) (not b!435926) (not b!435928) (not start!40014) (not b!435924) b_and!18223 (not b_lambda!9369) (not b!435923) (not b!435922) (not b!435919))
(check-sat b_and!18223 (not b_next!10281))
