; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39780 () Bool)

(assert start!39780)

(declare-fun b_free!10047 () Bool)

(declare-fun b_next!10047 () Bool)

(assert (=> start!39780 (= b_free!10047 (not b_next!10047))))

(declare-fun tp!35669 () Bool)

(declare-fun b_and!17753 () Bool)

(assert (=> start!39780 (= tp!35669 b_and!17753)))

(declare-fun b!428725 () Bool)

(declare-datatypes ((Unit!12589 0))(
  ( (Unit!12590) )
))
(declare-fun e!254036 () Unit!12589)

(declare-fun Unit!12591 () Unit!12589)

(assert (=> b!428725 (= e!254036 Unit!12591)))

(declare-fun b!428726 () Bool)

(declare-fun res!251697 () Bool)

(declare-fun e!254034 () Bool)

(assert (=> b!428726 (=> (not res!251697) (not e!254034))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428726 (= res!251697 (validMask!0 mask!1025))))

(declare-fun b!428727 () Bool)

(declare-fun e!254035 () Bool)

(declare-fun e!254031 () Bool)

(assert (=> b!428727 (= e!254035 (not e!254031))))

(declare-fun res!251703 () Bool)

(assert (=> b!428727 (=> res!251703 e!254031)))

(declare-datatypes ((array!26235 0))(
  ( (array!26236 (arr!12567 (Array (_ BitVec 32) (_ BitVec 64))) (size!12919 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26235)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428727 (= res!251703 (not (validKeyInArray!0 (select (arr!12567 _keys!709) from!863))))))

(declare-datatypes ((V!16037 0))(
  ( (V!16038 (val!5644 Int)) )
))
(declare-datatypes ((tuple2!7430 0))(
  ( (tuple2!7431 (_1!3726 (_ BitVec 64)) (_2!3726 V!16037)) )
))
(declare-datatypes ((List!7444 0))(
  ( (Nil!7441) (Cons!7440 (h!8296 tuple2!7430) (t!12940 List!7444)) )
))
(declare-datatypes ((ListLongMap!6343 0))(
  ( (ListLongMap!6344 (toList!3187 List!7444)) )
))
(declare-fun lt!195900 () ListLongMap!6343)

(declare-fun lt!195898 () ListLongMap!6343)

(assert (=> b!428727 (= lt!195900 lt!195898)))

(declare-fun lt!195905 () ListLongMap!6343)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16037)

(declare-fun +!1339 (ListLongMap!6343 tuple2!7430) ListLongMap!6343)

(assert (=> b!428727 (= lt!195898 (+!1339 lt!195905 (tuple2!7431 k0!794 v!412)))))

(declare-fun minValue!515 () V!16037)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!195903 () array!26235)

(declare-fun zeroValue!515 () V!16037)

(declare-datatypes ((ValueCell!5256 0))(
  ( (ValueCellFull!5256 (v!7891 V!16037)) (EmptyCell!5256) )
))
(declare-datatypes ((array!26237 0))(
  ( (array!26238 (arr!12568 (Array (_ BitVec 32) ValueCell!5256)) (size!12920 (_ BitVec 32))) )
))
(declare-fun lt!195901 () array!26237)

(declare-fun getCurrentListMapNoExtraKeys!1389 (array!26235 array!26237 (_ BitVec 32) (_ BitVec 32) V!16037 V!16037 (_ BitVec 32) Int) ListLongMap!6343)

(assert (=> b!428727 (= lt!195900 (getCurrentListMapNoExtraKeys!1389 lt!195903 lt!195901 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!26237)

(assert (=> b!428727 (= lt!195905 (getCurrentListMapNoExtraKeys!1389 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!195899 () Unit!12589)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!530 (array!26235 array!26237 (_ BitVec 32) (_ BitVec 32) V!16037 V!16037 (_ BitVec 32) (_ BitVec 64) V!16037 (_ BitVec 32) Int) Unit!12589)

(assert (=> b!428727 (= lt!195899 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!530 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428728 () Bool)

(declare-fun res!251695 () Bool)

(assert (=> b!428728 (=> (not res!251695) (not e!254034))))

(declare-fun arrayContainsKey!0 (array!26235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428728 (= res!251695 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428729 () Bool)

(declare-fun e!254037 () Bool)

(declare-fun tp_is_empty!11199 () Bool)

(assert (=> b!428729 (= e!254037 tp_is_empty!11199)))

(declare-fun b!428730 () Bool)

(declare-fun res!251705 () Bool)

(declare-fun e!254032 () Bool)

(assert (=> b!428730 (=> (not res!251705) (not e!254032))))

(declare-datatypes ((List!7445 0))(
  ( (Nil!7442) (Cons!7441 (h!8297 (_ BitVec 64)) (t!12941 List!7445)) )
))
(declare-fun arrayNoDuplicates!0 (array!26235 (_ BitVec 32) List!7445) Bool)

(assert (=> b!428730 (= res!251705 (arrayNoDuplicates!0 lt!195903 #b00000000000000000000000000000000 Nil!7442))))

(declare-fun mapNonEmpty!18420 () Bool)

(declare-fun mapRes!18420 () Bool)

(declare-fun tp!35670 () Bool)

(declare-fun e!254033 () Bool)

(assert (=> mapNonEmpty!18420 (= mapRes!18420 (and tp!35670 e!254033))))

(declare-fun mapKey!18420 () (_ BitVec 32))

(declare-fun mapValue!18420 () ValueCell!5256)

(declare-fun mapRest!18420 () (Array (_ BitVec 32) ValueCell!5256))

(assert (=> mapNonEmpty!18420 (= (arr!12568 _values!549) (store mapRest!18420 mapKey!18420 mapValue!18420))))

(declare-fun b!428731 () Bool)

(declare-fun res!251699 () Bool)

(assert (=> b!428731 (=> (not res!251699) (not e!254034))))

(assert (=> b!428731 (= res!251699 (validKeyInArray!0 k0!794))))

(declare-fun res!251704 () Bool)

(assert (=> start!39780 (=> (not res!251704) (not e!254034))))

(assert (=> start!39780 (= res!251704 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12919 _keys!709))))))

(assert (=> start!39780 e!254034))

(assert (=> start!39780 tp_is_empty!11199))

(assert (=> start!39780 tp!35669))

(assert (=> start!39780 true))

(declare-fun e!254030 () Bool)

(declare-fun array_inv!9158 (array!26237) Bool)

(assert (=> start!39780 (and (array_inv!9158 _values!549) e!254030)))

(declare-fun array_inv!9159 (array!26235) Bool)

(assert (=> start!39780 (array_inv!9159 _keys!709)))

(declare-fun b!428732 () Bool)

(declare-fun res!251700 () Bool)

(assert (=> b!428732 (=> (not res!251700) (not e!254034))))

(assert (=> b!428732 (= res!251700 (and (= (size!12920 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12919 _keys!709) (size!12920 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428733 () Bool)

(declare-fun res!251693 () Bool)

(assert (=> b!428733 (=> (not res!251693) (not e!254034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26235 (_ BitVec 32)) Bool)

(assert (=> b!428733 (= res!251693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428734 () Bool)

(assert (=> b!428734 (= e!254033 tp_is_empty!11199)))

(declare-fun b!428735 () Bool)

(assert (=> b!428735 (= e!254032 e!254035)))

(declare-fun res!251696 () Bool)

(assert (=> b!428735 (=> (not res!251696) (not e!254035))))

(assert (=> b!428735 (= res!251696 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195897 () ListLongMap!6343)

(assert (=> b!428735 (= lt!195897 (getCurrentListMapNoExtraKeys!1389 lt!195903 lt!195901 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428735 (= lt!195901 (array!26238 (store (arr!12568 _values!549) i!563 (ValueCellFull!5256 v!412)) (size!12920 _values!549)))))

(declare-fun lt!195904 () ListLongMap!6343)

(assert (=> b!428735 (= lt!195904 (getCurrentListMapNoExtraKeys!1389 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18420 () Bool)

(assert (=> mapIsEmpty!18420 mapRes!18420))

(declare-fun b!428736 () Bool)

(declare-fun res!251694 () Bool)

(assert (=> b!428736 (=> (not res!251694) (not e!254034))))

(assert (=> b!428736 (= res!251694 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12919 _keys!709))))))

(declare-fun b!428737 () Bool)

(assert (=> b!428737 (= e!254034 e!254032)))

(declare-fun res!251706 () Bool)

(assert (=> b!428737 (=> (not res!251706) (not e!254032))))

(assert (=> b!428737 (= res!251706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195903 mask!1025))))

(assert (=> b!428737 (= lt!195903 (array!26236 (store (arr!12567 _keys!709) i!563 k0!794) (size!12919 _keys!709)))))

(declare-fun b!428738 () Bool)

(assert (=> b!428738 (= e!254031 true)))

(assert (=> b!428738 (not (= (select (arr!12567 _keys!709) from!863) k0!794))))

(declare-fun lt!195896 () Unit!12589)

(assert (=> b!428738 (= lt!195896 e!254036)))

(declare-fun c!55406 () Bool)

(assert (=> b!428738 (= c!55406 (= (select (arr!12567 _keys!709) from!863) k0!794))))

(declare-fun get!6229 (ValueCell!5256 V!16037) V!16037)

(declare-fun dynLambda!766 (Int (_ BitVec 64)) V!16037)

(assert (=> b!428738 (= lt!195897 (+!1339 lt!195898 (tuple2!7431 (select (arr!12567 _keys!709) from!863) (get!6229 (select (arr!12568 _values!549) from!863) (dynLambda!766 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428739 () Bool)

(declare-fun res!251698 () Bool)

(assert (=> b!428739 (=> (not res!251698) (not e!254032))))

(assert (=> b!428739 (= res!251698 (bvsle from!863 i!563))))

(declare-fun b!428740 () Bool)

(assert (=> b!428740 (= e!254030 (and e!254037 mapRes!18420))))

(declare-fun condMapEmpty!18420 () Bool)

(declare-fun mapDefault!18420 () ValueCell!5256)

(assert (=> b!428740 (= condMapEmpty!18420 (= (arr!12568 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5256)) mapDefault!18420)))))

(declare-fun b!428741 () Bool)

(declare-fun Unit!12592 () Unit!12589)

(assert (=> b!428741 (= e!254036 Unit!12592)))

(declare-fun lt!195902 () Unit!12589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26235 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12589)

(assert (=> b!428741 (= lt!195902 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428741 false))

(declare-fun b!428742 () Bool)

(declare-fun res!251701 () Bool)

(assert (=> b!428742 (=> (not res!251701) (not e!254034))))

(assert (=> b!428742 (= res!251701 (or (= (select (arr!12567 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12567 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428743 () Bool)

(declare-fun res!251702 () Bool)

(assert (=> b!428743 (=> (not res!251702) (not e!254034))))

(assert (=> b!428743 (= res!251702 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7442))))

(assert (= (and start!39780 res!251704) b!428726))

(assert (= (and b!428726 res!251697) b!428732))

(assert (= (and b!428732 res!251700) b!428733))

(assert (= (and b!428733 res!251693) b!428743))

(assert (= (and b!428743 res!251702) b!428736))

(assert (= (and b!428736 res!251694) b!428731))

(assert (= (and b!428731 res!251699) b!428742))

(assert (= (and b!428742 res!251701) b!428728))

(assert (= (and b!428728 res!251695) b!428737))

(assert (= (and b!428737 res!251706) b!428730))

(assert (= (and b!428730 res!251705) b!428739))

(assert (= (and b!428739 res!251698) b!428735))

(assert (= (and b!428735 res!251696) b!428727))

(assert (= (and b!428727 (not res!251703)) b!428738))

(assert (= (and b!428738 c!55406) b!428741))

(assert (= (and b!428738 (not c!55406)) b!428725))

(assert (= (and b!428740 condMapEmpty!18420) mapIsEmpty!18420))

(assert (= (and b!428740 (not condMapEmpty!18420)) mapNonEmpty!18420))

(get-info :version)

(assert (= (and mapNonEmpty!18420 ((_ is ValueCellFull!5256) mapValue!18420)) b!428734))

(assert (= (and b!428740 ((_ is ValueCellFull!5256) mapDefault!18420)) b!428729))

(assert (= start!39780 b!428740))

(declare-fun b_lambda!9135 () Bool)

(assert (=> (not b_lambda!9135) (not b!428738)))

(declare-fun t!12939 () Bool)

(declare-fun tb!3453 () Bool)

(assert (=> (and start!39780 (= defaultEntry!557 defaultEntry!557) t!12939) tb!3453))

(declare-fun result!6433 () Bool)

(assert (=> tb!3453 (= result!6433 tp_is_empty!11199)))

(assert (=> b!428738 t!12939))

(declare-fun b_and!17755 () Bool)

(assert (= b_and!17753 (and (=> t!12939 result!6433) b_and!17755)))

(declare-fun m!417121 () Bool)

(assert (=> b!428730 m!417121))

(declare-fun m!417123 () Bool)

(assert (=> b!428731 m!417123))

(declare-fun m!417125 () Bool)

(assert (=> b!428727 m!417125))

(declare-fun m!417127 () Bool)

(assert (=> b!428727 m!417127))

(declare-fun m!417129 () Bool)

(assert (=> b!428727 m!417129))

(assert (=> b!428727 m!417125))

(declare-fun m!417131 () Bool)

(assert (=> b!428727 m!417131))

(declare-fun m!417133 () Bool)

(assert (=> b!428727 m!417133))

(declare-fun m!417135 () Bool)

(assert (=> b!428727 m!417135))

(assert (=> b!428738 m!417125))

(declare-fun m!417137 () Bool)

(assert (=> b!428738 m!417137))

(declare-fun m!417139 () Bool)

(assert (=> b!428738 m!417139))

(declare-fun m!417141 () Bool)

(assert (=> b!428738 m!417141))

(assert (=> b!428738 m!417139))

(assert (=> b!428738 m!417137))

(declare-fun m!417143 () Bool)

(assert (=> b!428738 m!417143))

(declare-fun m!417145 () Bool)

(assert (=> mapNonEmpty!18420 m!417145))

(declare-fun m!417147 () Bool)

(assert (=> b!428737 m!417147))

(declare-fun m!417149 () Bool)

(assert (=> b!428737 m!417149))

(declare-fun m!417151 () Bool)

(assert (=> b!428735 m!417151))

(declare-fun m!417153 () Bool)

(assert (=> b!428735 m!417153))

(declare-fun m!417155 () Bool)

(assert (=> b!428735 m!417155))

(declare-fun m!417157 () Bool)

(assert (=> b!428743 m!417157))

(declare-fun m!417159 () Bool)

(assert (=> b!428728 m!417159))

(declare-fun m!417161 () Bool)

(assert (=> b!428726 m!417161))

(declare-fun m!417163 () Bool)

(assert (=> b!428733 m!417163))

(declare-fun m!417165 () Bool)

(assert (=> start!39780 m!417165))

(declare-fun m!417167 () Bool)

(assert (=> start!39780 m!417167))

(declare-fun m!417169 () Bool)

(assert (=> b!428742 m!417169))

(declare-fun m!417171 () Bool)

(assert (=> b!428741 m!417171))

(check-sat (not b!428738) (not b!428727) (not b_next!10047) (not start!39780) (not b!428735) b_and!17755 (not b!428741) (not b!428733) (not b!428726) (not b!428728) (not b!428731) (not b!428737) (not b!428743) (not b!428730) tp_is_empty!11199 (not mapNonEmpty!18420) (not b_lambda!9135))
(check-sat b_and!17755 (not b_next!10047))
