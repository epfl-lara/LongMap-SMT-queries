; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40004 () Bool)

(assert start!40004)

(declare-fun b_free!10285 () Bool)

(declare-fun b_next!10285 () Bool)

(assert (=> start!40004 (= b_free!10285 (not b_next!10285))))

(declare-fun tp!36383 () Bool)

(declare-fun b_and!18203 () Bool)

(assert (=> start!40004 (= tp!36383 b_and!18203)))

(declare-fun b!435765 () Bool)

(declare-fun e!257363 () Bool)

(declare-fun e!257364 () Bool)

(assert (=> b!435765 (= e!257363 e!257364)))

(declare-fun res!256862 () Bool)

(assert (=> b!435765 (=> res!256862 e!257364)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26697 0))(
  ( (array!26698 (arr!12798 (Array (_ BitVec 32) (_ BitVec 64))) (size!13151 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26697)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!435765 (= res!256862 (= k0!794 (select (arr!12798 _keys!709) from!863)))))

(assert (=> b!435765 (not (= (select (arr!12798 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12934 0))(
  ( (Unit!12935) )
))
(declare-fun lt!200683 () Unit!12934)

(declare-fun e!257361 () Unit!12934)

(assert (=> b!435765 (= lt!200683 e!257361)))

(declare-fun c!55692 () Bool)

(assert (=> b!435765 (= c!55692 (= (select (arr!12798 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16355 0))(
  ( (V!16356 (val!5763 Int)) )
))
(declare-datatypes ((tuple2!7646 0))(
  ( (tuple2!7647 (_1!3834 (_ BitVec 64)) (_2!3834 V!16355)) )
))
(declare-datatypes ((List!7633 0))(
  ( (Nil!7630) (Cons!7629 (h!8485 tuple2!7646) (t!13358 List!7633)) )
))
(declare-datatypes ((ListLongMap!6549 0))(
  ( (ListLongMap!6550 (toList!3290 List!7633)) )
))
(declare-fun lt!200682 () ListLongMap!6549)

(declare-fun lt!200686 () ListLongMap!6549)

(assert (=> b!435765 (= lt!200682 lt!200686)))

(declare-fun lt!200688 () ListLongMap!6549)

(declare-fun lt!200695 () tuple2!7646)

(declare-fun +!1465 (ListLongMap!6549 tuple2!7646) ListLongMap!6549)

(assert (=> b!435765 (= lt!200686 (+!1465 lt!200688 lt!200695))))

(declare-fun lt!200694 () V!16355)

(assert (=> b!435765 (= lt!200695 (tuple2!7647 (select (arr!12798 _keys!709) from!863) lt!200694))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5375 0))(
  ( (ValueCellFull!5375 (v!8004 V!16355)) (EmptyCell!5375) )
))
(declare-datatypes ((array!26699 0))(
  ( (array!26700 (arr!12799 (Array (_ BitVec 32) ValueCell!5375)) (size!13152 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26699)

(declare-fun get!6386 (ValueCell!5375 V!16355) V!16355)

(declare-fun dynLambda!840 (Int (_ BitVec 64)) V!16355)

(assert (=> b!435765 (= lt!200694 (get!6386 (select (arr!12799 _values!549) from!863) (dynLambda!840 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18777 () Bool)

(declare-fun mapRes!18777 () Bool)

(assert (=> mapIsEmpty!18777 mapRes!18777))

(declare-fun b!435766 () Bool)

(declare-fun Unit!12936 () Unit!12934)

(assert (=> b!435766 (= e!257361 Unit!12936)))

(declare-fun lt!200691 () Unit!12934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26697 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12934)

(assert (=> b!435766 (= lt!200691 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435766 false))

(declare-fun mapNonEmpty!18777 () Bool)

(declare-fun tp!36384 () Bool)

(declare-fun e!257359 () Bool)

(assert (=> mapNonEmpty!18777 (= mapRes!18777 (and tp!36384 e!257359))))

(declare-fun mapRest!18777 () (Array (_ BitVec 32) ValueCell!5375))

(declare-fun mapKey!18777 () (_ BitVec 32))

(declare-fun mapValue!18777 () ValueCell!5375)

(assert (=> mapNonEmpty!18777 (= (arr!12799 _values!549) (store mapRest!18777 mapKey!18777 mapValue!18777))))

(declare-fun b!435767 () Bool)

(declare-fun res!256864 () Bool)

(declare-fun e!257360 () Bool)

(assert (=> b!435767 (=> (not res!256864) (not e!257360))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435767 (= res!256864 (or (= (select (arr!12798 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12798 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435768 () Bool)

(declare-fun res!256860 () Bool)

(assert (=> b!435768 (=> (not res!256860) (not e!257360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435768 (= res!256860 (validKeyInArray!0 k0!794))))

(declare-fun b!435769 () Bool)

(declare-fun res!256859 () Bool)

(assert (=> b!435769 (=> (not res!256859) (not e!257360))))

(assert (=> b!435769 (= res!256859 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13151 _keys!709))))))

(declare-fun b!435770 () Bool)

(declare-fun tp_is_empty!11437 () Bool)

(assert (=> b!435770 (= e!257359 tp_is_empty!11437)))

(declare-fun b!435771 () Bool)

(declare-fun res!256855 () Bool)

(declare-fun e!257365 () Bool)

(assert (=> b!435771 (=> (not res!256855) (not e!257365))))

(assert (=> b!435771 (= res!256855 (bvsle from!863 i!563))))

(declare-fun b!435772 () Bool)

(declare-fun e!257367 () Bool)

(assert (=> b!435772 (= e!257365 e!257367)))

(declare-fun res!256854 () Bool)

(assert (=> b!435772 (=> (not res!256854) (not e!257367))))

(assert (=> b!435772 (= res!256854 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16355)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!200696 () array!26699)

(declare-fun zeroValue!515 () V!16355)

(declare-fun lt!200693 () array!26697)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1489 (array!26697 array!26699 (_ BitVec 32) (_ BitVec 32) V!16355 V!16355 (_ BitVec 32) Int) ListLongMap!6549)

(assert (=> b!435772 (= lt!200682 (getCurrentListMapNoExtraKeys!1489 lt!200693 lt!200696 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16355)

(assert (=> b!435772 (= lt!200696 (array!26700 (store (arr!12799 _values!549) i!563 (ValueCellFull!5375 v!412)) (size!13152 _values!549)))))

(declare-fun lt!200690 () ListLongMap!6549)

(assert (=> b!435772 (= lt!200690 (getCurrentListMapNoExtraKeys!1489 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435773 () Bool)

(declare-fun e!257366 () Bool)

(declare-fun e!257358 () Bool)

(assert (=> b!435773 (= e!257366 (and e!257358 mapRes!18777))))

(declare-fun condMapEmpty!18777 () Bool)

(declare-fun mapDefault!18777 () ValueCell!5375)

(assert (=> b!435773 (= condMapEmpty!18777 (= (arr!12799 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5375)) mapDefault!18777)))))

(declare-fun res!256857 () Bool)

(assert (=> start!40004 (=> (not res!256857) (not e!257360))))

(assert (=> start!40004 (= res!256857 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13151 _keys!709))))))

(assert (=> start!40004 e!257360))

(assert (=> start!40004 tp_is_empty!11437))

(assert (=> start!40004 tp!36383))

(assert (=> start!40004 true))

(declare-fun array_inv!9346 (array!26699) Bool)

(assert (=> start!40004 (and (array_inv!9346 _values!549) e!257366)))

(declare-fun array_inv!9347 (array!26697) Bool)

(assert (=> start!40004 (array_inv!9347 _keys!709)))

(declare-fun b!435774 () Bool)

(declare-fun res!256863 () Bool)

(assert (=> b!435774 (=> (not res!256863) (not e!257360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435774 (= res!256863 (validMask!0 mask!1025))))

(declare-fun b!435775 () Bool)

(assert (=> b!435775 (= e!257360 e!257365)))

(declare-fun res!256858 () Bool)

(assert (=> b!435775 (=> (not res!256858) (not e!257365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26697 (_ BitVec 32)) Bool)

(assert (=> b!435775 (= res!256858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200693 mask!1025))))

(assert (=> b!435775 (= lt!200693 (array!26698 (store (arr!12798 _keys!709) i!563 k0!794) (size!13151 _keys!709)))))

(declare-fun b!435776 () Bool)

(declare-fun res!256853 () Bool)

(assert (=> b!435776 (=> (not res!256853) (not e!257360))))

(assert (=> b!435776 (= res!256853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435777 () Bool)

(declare-fun res!256861 () Bool)

(assert (=> b!435777 (=> (not res!256861) (not e!257360))))

(declare-fun arrayContainsKey!0 (array!26697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435777 (= res!256861 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435778 () Bool)

(declare-fun res!256856 () Bool)

(assert (=> b!435778 (=> (not res!256856) (not e!257360))))

(assert (=> b!435778 (= res!256856 (and (= (size!13152 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13151 _keys!709) (size!13152 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435779 () Bool)

(declare-fun Unit!12937 () Unit!12934)

(assert (=> b!435779 (= e!257361 Unit!12937)))

(declare-fun b!435780 () Bool)

(declare-fun res!256865 () Bool)

(assert (=> b!435780 (=> (not res!256865) (not e!257365))))

(declare-datatypes ((List!7634 0))(
  ( (Nil!7631) (Cons!7630 (h!8486 (_ BitVec 64)) (t!13359 List!7634)) )
))
(declare-fun arrayNoDuplicates!0 (array!26697 (_ BitVec 32) List!7634) Bool)

(assert (=> b!435780 (= res!256865 (arrayNoDuplicates!0 lt!200693 #b00000000000000000000000000000000 Nil!7631))))

(declare-fun b!435781 () Bool)

(assert (=> b!435781 (= e!257367 (not e!257363))))

(declare-fun res!256866 () Bool)

(assert (=> b!435781 (=> res!256866 e!257363)))

(assert (=> b!435781 (= res!256866 (not (validKeyInArray!0 (select (arr!12798 _keys!709) from!863))))))

(declare-fun lt!200685 () ListLongMap!6549)

(assert (=> b!435781 (= lt!200685 lt!200688)))

(declare-fun lt!200692 () ListLongMap!6549)

(declare-fun lt!200687 () tuple2!7646)

(assert (=> b!435781 (= lt!200688 (+!1465 lt!200692 lt!200687))))

(assert (=> b!435781 (= lt!200685 (getCurrentListMapNoExtraKeys!1489 lt!200693 lt!200696 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435781 (= lt!200687 (tuple2!7647 k0!794 v!412))))

(assert (=> b!435781 (= lt!200692 (getCurrentListMapNoExtraKeys!1489 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200689 () Unit!12934)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!606 (array!26697 array!26699 (_ BitVec 32) (_ BitVec 32) V!16355 V!16355 (_ BitVec 32) (_ BitVec 64) V!16355 (_ BitVec 32) Int) Unit!12934)

(assert (=> b!435781 (= lt!200689 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!606 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435782 () Bool)

(assert (=> b!435782 (= e!257358 tp_is_empty!11437)))

(declare-fun b!435783 () Bool)

(assert (=> b!435783 (= e!257364 true)))

(assert (=> b!435783 (= lt!200686 (+!1465 (+!1465 lt!200692 lt!200695) lt!200687))))

(declare-fun lt!200684 () Unit!12934)

(declare-fun addCommutativeForDiffKeys!415 (ListLongMap!6549 (_ BitVec 64) V!16355 (_ BitVec 64) V!16355) Unit!12934)

(assert (=> b!435783 (= lt!200684 (addCommutativeForDiffKeys!415 lt!200692 k0!794 v!412 (select (arr!12798 _keys!709) from!863) lt!200694))))

(declare-fun b!435784 () Bool)

(declare-fun res!256852 () Bool)

(assert (=> b!435784 (=> (not res!256852) (not e!257360))))

(assert (=> b!435784 (= res!256852 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7631))))

(assert (= (and start!40004 res!256857) b!435774))

(assert (= (and b!435774 res!256863) b!435778))

(assert (= (and b!435778 res!256856) b!435776))

(assert (= (and b!435776 res!256853) b!435784))

(assert (= (and b!435784 res!256852) b!435769))

(assert (= (and b!435769 res!256859) b!435768))

(assert (= (and b!435768 res!256860) b!435767))

(assert (= (and b!435767 res!256864) b!435777))

(assert (= (and b!435777 res!256861) b!435775))

(assert (= (and b!435775 res!256858) b!435780))

(assert (= (and b!435780 res!256865) b!435771))

(assert (= (and b!435771 res!256855) b!435772))

(assert (= (and b!435772 res!256854) b!435781))

(assert (= (and b!435781 (not res!256866)) b!435765))

(assert (= (and b!435765 c!55692) b!435766))

(assert (= (and b!435765 (not c!55692)) b!435779))

(assert (= (and b!435765 (not res!256862)) b!435783))

(assert (= (and b!435773 condMapEmpty!18777) mapIsEmpty!18777))

(assert (= (and b!435773 (not condMapEmpty!18777)) mapNonEmpty!18777))

(get-info :version)

(assert (= (and mapNonEmpty!18777 ((_ is ValueCellFull!5375) mapValue!18777)) b!435770))

(assert (= (and b!435773 ((_ is ValueCellFull!5375) mapDefault!18777)) b!435782))

(assert (= start!40004 b!435773))

(declare-fun b_lambda!9355 () Bool)

(assert (=> (not b_lambda!9355) (not b!435765)))

(declare-fun t!13357 () Bool)

(declare-fun tb!3683 () Bool)

(assert (=> (and start!40004 (= defaultEntry!557 defaultEntry!557) t!13357) tb!3683))

(declare-fun result!6901 () Bool)

(assert (=> tb!3683 (= result!6901 tp_is_empty!11437)))

(assert (=> b!435765 t!13357))

(declare-fun b_and!18205 () Bool)

(assert (= b_and!18203 (and (=> t!13357 result!6901) b_and!18205)))

(declare-fun m!423153 () Bool)

(assert (=> b!435774 m!423153))

(declare-fun m!423155 () Bool)

(assert (=> b!435776 m!423155))

(declare-fun m!423157 () Bool)

(assert (=> b!435768 m!423157))

(declare-fun m!423159 () Bool)

(assert (=> mapNonEmpty!18777 m!423159))

(declare-fun m!423161 () Bool)

(assert (=> b!435780 m!423161))

(declare-fun m!423163 () Bool)

(assert (=> b!435777 m!423163))

(declare-fun m!423165 () Bool)

(assert (=> b!435775 m!423165))

(declare-fun m!423167 () Bool)

(assert (=> b!435775 m!423167))

(declare-fun m!423169 () Bool)

(assert (=> b!435766 m!423169))

(declare-fun m!423171 () Bool)

(assert (=> b!435767 m!423171))

(declare-fun m!423173 () Bool)

(assert (=> b!435772 m!423173))

(declare-fun m!423175 () Bool)

(assert (=> b!435772 m!423175))

(declare-fun m!423177 () Bool)

(assert (=> b!435772 m!423177))

(declare-fun m!423179 () Bool)

(assert (=> start!40004 m!423179))

(declare-fun m!423181 () Bool)

(assert (=> start!40004 m!423181))

(declare-fun m!423183 () Bool)

(assert (=> b!435784 m!423183))

(declare-fun m!423185 () Bool)

(assert (=> b!435781 m!423185))

(declare-fun m!423187 () Bool)

(assert (=> b!435781 m!423187))

(declare-fun m!423189 () Bool)

(assert (=> b!435781 m!423189))

(assert (=> b!435781 m!423185))

(declare-fun m!423191 () Bool)

(assert (=> b!435781 m!423191))

(declare-fun m!423193 () Bool)

(assert (=> b!435781 m!423193))

(declare-fun m!423195 () Bool)

(assert (=> b!435781 m!423195))

(declare-fun m!423197 () Bool)

(assert (=> b!435783 m!423197))

(assert (=> b!435783 m!423197))

(declare-fun m!423199 () Bool)

(assert (=> b!435783 m!423199))

(assert (=> b!435783 m!423185))

(assert (=> b!435783 m!423185))

(declare-fun m!423201 () Bool)

(assert (=> b!435783 m!423201))

(assert (=> b!435765 m!423185))

(declare-fun m!423203 () Bool)

(assert (=> b!435765 m!423203))

(declare-fun m!423205 () Bool)

(assert (=> b!435765 m!423205))

(declare-fun m!423207 () Bool)

(assert (=> b!435765 m!423207))

(assert (=> b!435765 m!423205))

(assert (=> b!435765 m!423203))

(declare-fun m!423209 () Bool)

(assert (=> b!435765 m!423209))

(check-sat (not b!435781) (not b!435784) (not b_next!10285) (not b!435776) b_and!18205 (not b!435765) (not start!40004) (not mapNonEmpty!18777) tp_is_empty!11437 (not b!435768) (not b!435772) (not b!435783) (not b_lambda!9355) (not b!435766) (not b!435780) (not b!435774) (not b!435777) (not b!435775))
(check-sat b_and!18205 (not b_next!10285))
