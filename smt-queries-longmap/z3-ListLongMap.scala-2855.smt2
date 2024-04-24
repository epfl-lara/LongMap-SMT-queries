; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41146 () Bool)

(assert start!41146)

(declare-fun b_free!11029 () Bool)

(declare-fun b_next!11029 () Bool)

(assert (=> start!41146 (= b_free!11029 (not b_next!11029))))

(declare-fun tp!38922 () Bool)

(declare-fun b_and!19307 () Bool)

(assert (=> start!41146 (= tp!38922 b_and!19307)))

(declare-fun b!459635 () Bool)

(declare-fun res!274742 () Bool)

(declare-fun e!268232 () Bool)

(assert (=> b!459635 (=> (not res!274742) (not e!268232))))

(declare-datatypes ((array!28528 0))(
  ( (array!28529 (arr!13704 (Array (_ BitVec 32) (_ BitVec 64))) (size!14056 (_ BitVec 32))) )
))
(declare-fun lt!208007 () array!28528)

(declare-datatypes ((List!8201 0))(
  ( (Nil!8198) (Cons!8197 (h!9053 (_ BitVec 64)) (t!14101 List!8201)) )
))
(declare-fun arrayNoDuplicates!0 (array!28528 (_ BitVec 32) List!8201) Bool)

(assert (=> b!459635 (= res!274742 (arrayNoDuplicates!0 lt!208007 #b00000000000000000000000000000000 Nil!8198))))

(declare-fun b!459636 () Bool)

(declare-fun res!274749 () Bool)

(declare-fun e!268234 () Bool)

(assert (=> b!459636 (=> (not res!274749) (not e!268234))))

(declare-fun _keys!709 () array!28528)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17595 0))(
  ( (V!17596 (val!6228 Int)) )
))
(declare-datatypes ((ValueCell!5840 0))(
  ( (ValueCellFull!5840 (v!8507 V!17595)) (EmptyCell!5840) )
))
(declare-datatypes ((array!28530 0))(
  ( (array!28531 (arr!13705 (Array (_ BitVec 32) ValueCell!5840)) (size!14057 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28530)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!459636 (= res!274749 (and (= (size!14057 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14056 _keys!709) (size!14057 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459637 () Bool)

(declare-fun res!274755 () Bool)

(assert (=> b!459637 (=> (not res!274755) (not e!268234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28528 (_ BitVec 32)) Bool)

(assert (=> b!459637 (= res!274755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459638 () Bool)

(declare-fun res!274745 () Bool)

(assert (=> b!459638 (=> (not res!274745) (not e!268234))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459638 (= res!274745 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459639 () Bool)

(declare-fun e!268235 () Bool)

(declare-fun tp_is_empty!12367 () Bool)

(assert (=> b!459639 (= e!268235 tp_is_empty!12367)))

(declare-fun b!459640 () Bool)

(declare-fun e!268236 () Bool)

(assert (=> b!459640 (= e!268232 e!268236)))

(declare-fun res!274746 () Bool)

(assert (=> b!459640 (=> (not res!274746) (not e!268236))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459640 (= res!274746 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17595)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17595)

(declare-datatypes ((tuple2!8134 0))(
  ( (tuple2!8135 (_1!4078 (_ BitVec 64)) (_2!4078 V!17595)) )
))
(declare-datatypes ((List!8202 0))(
  ( (Nil!8199) (Cons!8198 (h!9054 tuple2!8134) (t!14102 List!8202)) )
))
(declare-datatypes ((ListLongMap!7049 0))(
  ( (ListLongMap!7050 (toList!3540 List!8202)) )
))
(declare-fun lt!208011 () ListLongMap!7049)

(declare-fun lt!208009 () array!28530)

(declare-fun getCurrentListMapNoExtraKeys!1769 (array!28528 array!28530 (_ BitVec 32) (_ BitVec 32) V!17595 V!17595 (_ BitVec 32) Int) ListLongMap!7049)

(assert (=> b!459640 (= lt!208011 (getCurrentListMapNoExtraKeys!1769 lt!208007 lt!208009 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17595)

(assert (=> b!459640 (= lt!208009 (array!28531 (store (arr!13705 _values!549) i!563 (ValueCellFull!5840 v!412)) (size!14057 _values!549)))))

(declare-fun lt!208010 () ListLongMap!7049)

(assert (=> b!459640 (= lt!208010 (getCurrentListMapNoExtraKeys!1769 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459641 () Bool)

(declare-fun res!274747 () Bool)

(assert (=> b!459641 (=> (not res!274747) (not e!268234))))

(assert (=> b!459641 (= res!274747 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8198))))

(declare-fun b!459643 () Bool)

(declare-fun res!274744 () Bool)

(assert (=> b!459643 (=> (not res!274744) (not e!268234))))

(assert (=> b!459643 (= res!274744 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14056 _keys!709))))))

(declare-fun mapIsEmpty!20200 () Bool)

(declare-fun mapRes!20200 () Bool)

(assert (=> mapIsEmpty!20200 mapRes!20200))

(declare-fun b!459644 () Bool)

(declare-datatypes ((Unit!13355 0))(
  ( (Unit!13356) )
))
(declare-fun e!268233 () Unit!13355)

(declare-fun Unit!13357 () Unit!13355)

(assert (=> b!459644 (= e!268233 Unit!13357)))

(declare-fun lt!208004 () Unit!13355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28528 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13355)

(assert (=> b!459644 (= lt!208004 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459644 false))

(declare-fun b!459645 () Bool)

(declare-fun e!268230 () Bool)

(assert (=> b!459645 (= e!268230 tp_is_empty!12367)))

(declare-fun b!459646 () Bool)

(declare-fun e!268231 () Bool)

(assert (=> b!459646 (= e!268231 (and e!268235 mapRes!20200))))

(declare-fun condMapEmpty!20200 () Bool)

(declare-fun mapDefault!20200 () ValueCell!5840)

(assert (=> b!459646 (= condMapEmpty!20200 (= (arr!13705 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5840)) mapDefault!20200)))))

(declare-fun b!459647 () Bool)

(declare-fun res!274751 () Bool)

(assert (=> b!459647 (=> (not res!274751) (not e!268232))))

(assert (=> b!459647 (= res!274751 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!20200 () Bool)

(declare-fun tp!38923 () Bool)

(assert (=> mapNonEmpty!20200 (= mapRes!20200 (and tp!38923 e!268230))))

(declare-fun mapRest!20200 () (Array (_ BitVec 32) ValueCell!5840))

(declare-fun mapValue!20200 () ValueCell!5840)

(declare-fun mapKey!20200 () (_ BitVec 32))

(assert (=> mapNonEmpty!20200 (= (arr!13705 _values!549) (store mapRest!20200 mapKey!20200 mapValue!20200))))

(declare-fun b!459648 () Bool)

(declare-fun res!274752 () Bool)

(assert (=> b!459648 (=> (not res!274752) (not e!268234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459648 (= res!274752 (validMask!0 mask!1025))))

(declare-fun b!459649 () Bool)

(declare-fun e!268228 () Bool)

(assert (=> b!459649 (= e!268228 (not (= k0!794 (select (arr!13704 _keys!709) from!863))))))

(assert (=> b!459649 (not (= (select (arr!13704 _keys!709) from!863) k0!794))))

(declare-fun lt!208006 () Unit!13355)

(assert (=> b!459649 (= lt!208006 e!268233)))

(declare-fun c!56465 () Bool)

(assert (=> b!459649 (= c!56465 (= (select (arr!13704 _keys!709) from!863) k0!794))))

(declare-fun lt!208005 () ListLongMap!7049)

(declare-fun +!1617 (ListLongMap!7049 tuple2!8134) ListLongMap!7049)

(declare-fun get!6766 (ValueCell!5840 V!17595) V!17595)

(declare-fun dynLambda!896 (Int (_ BitVec 64)) V!17595)

(assert (=> b!459649 (= lt!208011 (+!1617 lt!208005 (tuple2!8135 (select (arr!13704 _keys!709) from!863) (get!6766 (select (arr!13705 _values!549) from!863) (dynLambda!896 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!459650 () Bool)

(declare-fun Unit!13358 () Unit!13355)

(assert (=> b!459650 (= e!268233 Unit!13358)))

(declare-fun b!459651 () Bool)

(assert (=> b!459651 (= e!268234 e!268232)))

(declare-fun res!274743 () Bool)

(assert (=> b!459651 (=> (not res!274743) (not e!268232))))

(assert (=> b!459651 (= res!274743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208007 mask!1025))))

(assert (=> b!459651 (= lt!208007 (array!28529 (store (arr!13704 _keys!709) i!563 k0!794) (size!14056 _keys!709)))))

(declare-fun b!459642 () Bool)

(declare-fun res!274753 () Bool)

(assert (=> b!459642 (=> (not res!274753) (not e!268234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459642 (= res!274753 (validKeyInArray!0 k0!794))))

(declare-fun res!274750 () Bool)

(assert (=> start!41146 (=> (not res!274750) (not e!268234))))

(assert (=> start!41146 (= res!274750 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14056 _keys!709))))))

(assert (=> start!41146 e!268234))

(assert (=> start!41146 tp_is_empty!12367))

(assert (=> start!41146 tp!38922))

(assert (=> start!41146 true))

(declare-fun array_inv!9994 (array!28530) Bool)

(assert (=> start!41146 (and (array_inv!9994 _values!549) e!268231)))

(declare-fun array_inv!9995 (array!28528) Bool)

(assert (=> start!41146 (array_inv!9995 _keys!709)))

(declare-fun b!459652 () Bool)

(assert (=> b!459652 (= e!268236 (not e!268228))))

(declare-fun res!274754 () Bool)

(assert (=> b!459652 (=> res!274754 e!268228)))

(assert (=> b!459652 (= res!274754 (not (validKeyInArray!0 (select (arr!13704 _keys!709) from!863))))))

(declare-fun lt!208008 () ListLongMap!7049)

(assert (=> b!459652 (= lt!208008 lt!208005)))

(declare-fun lt!208012 () ListLongMap!7049)

(assert (=> b!459652 (= lt!208005 (+!1617 lt!208012 (tuple2!8135 k0!794 v!412)))))

(assert (=> b!459652 (= lt!208008 (getCurrentListMapNoExtraKeys!1769 lt!208007 lt!208009 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459652 (= lt!208012 (getCurrentListMapNoExtraKeys!1769 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208013 () Unit!13355)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!774 (array!28528 array!28530 (_ BitVec 32) (_ BitVec 32) V!17595 V!17595 (_ BitVec 32) (_ BitVec 64) V!17595 (_ BitVec 32) Int) Unit!13355)

(assert (=> b!459652 (= lt!208013 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!774 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459653 () Bool)

(declare-fun res!274748 () Bool)

(assert (=> b!459653 (=> (not res!274748) (not e!268234))))

(assert (=> b!459653 (= res!274748 (or (= (select (arr!13704 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13704 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!41146 res!274750) b!459648))

(assert (= (and b!459648 res!274752) b!459636))

(assert (= (and b!459636 res!274749) b!459637))

(assert (= (and b!459637 res!274755) b!459641))

(assert (= (and b!459641 res!274747) b!459643))

(assert (= (and b!459643 res!274744) b!459642))

(assert (= (and b!459642 res!274753) b!459653))

(assert (= (and b!459653 res!274748) b!459638))

(assert (= (and b!459638 res!274745) b!459651))

(assert (= (and b!459651 res!274743) b!459635))

(assert (= (and b!459635 res!274742) b!459647))

(assert (= (and b!459647 res!274751) b!459640))

(assert (= (and b!459640 res!274746) b!459652))

(assert (= (and b!459652 (not res!274754)) b!459649))

(assert (= (and b!459649 c!56465) b!459644))

(assert (= (and b!459649 (not c!56465)) b!459650))

(assert (= (and b!459646 condMapEmpty!20200) mapIsEmpty!20200))

(assert (= (and b!459646 (not condMapEmpty!20200)) mapNonEmpty!20200))

(get-info :version)

(assert (= (and mapNonEmpty!20200 ((_ is ValueCellFull!5840) mapValue!20200)) b!459645))

(assert (= (and b!459646 ((_ is ValueCellFull!5840) mapDefault!20200)) b!459639))

(assert (= start!41146 b!459646))

(declare-fun b_lambda!9877 () Bool)

(assert (=> (not b_lambda!9877) (not b!459649)))

(declare-fun t!14100 () Bool)

(declare-fun tb!3857 () Bool)

(assert (=> (and start!41146 (= defaultEntry!557 defaultEntry!557) t!14100) tb!3857))

(declare-fun result!7267 () Bool)

(assert (=> tb!3857 (= result!7267 tp_is_empty!12367)))

(assert (=> b!459649 t!14100))

(declare-fun b_and!19309 () Bool)

(assert (= b_and!19307 (and (=> t!14100 result!7267) b_and!19309)))

(declare-fun m!443129 () Bool)

(assert (=> b!459649 m!443129))

(declare-fun m!443131 () Bool)

(assert (=> b!459649 m!443131))

(declare-fun m!443133 () Bool)

(assert (=> b!459649 m!443133))

(declare-fun m!443135 () Bool)

(assert (=> b!459649 m!443135))

(assert (=> b!459649 m!443135))

(assert (=> b!459649 m!443131))

(declare-fun m!443137 () Bool)

(assert (=> b!459649 m!443137))

(declare-fun m!443139 () Bool)

(assert (=> b!459638 m!443139))

(declare-fun m!443141 () Bool)

(assert (=> b!459640 m!443141))

(declare-fun m!443143 () Bool)

(assert (=> b!459640 m!443143))

(declare-fun m!443145 () Bool)

(assert (=> b!459640 m!443145))

(declare-fun m!443147 () Bool)

(assert (=> mapNonEmpty!20200 m!443147))

(declare-fun m!443149 () Bool)

(assert (=> b!459642 m!443149))

(declare-fun m!443151 () Bool)

(assert (=> b!459651 m!443151))

(declare-fun m!443153 () Bool)

(assert (=> b!459651 m!443153))

(declare-fun m!443155 () Bool)

(assert (=> b!459644 m!443155))

(declare-fun m!443157 () Bool)

(assert (=> b!459641 m!443157))

(assert (=> b!459652 m!443129))

(declare-fun m!443159 () Bool)

(assert (=> b!459652 m!443159))

(declare-fun m!443161 () Bool)

(assert (=> b!459652 m!443161))

(assert (=> b!459652 m!443129))

(declare-fun m!443163 () Bool)

(assert (=> b!459652 m!443163))

(declare-fun m!443165 () Bool)

(assert (=> b!459652 m!443165))

(declare-fun m!443167 () Bool)

(assert (=> b!459652 m!443167))

(declare-fun m!443169 () Bool)

(assert (=> b!459648 m!443169))

(declare-fun m!443171 () Bool)

(assert (=> b!459653 m!443171))

(declare-fun m!443173 () Bool)

(assert (=> start!41146 m!443173))

(declare-fun m!443175 () Bool)

(assert (=> start!41146 m!443175))

(declare-fun m!443177 () Bool)

(assert (=> b!459635 m!443177))

(declare-fun m!443179 () Bool)

(assert (=> b!459637 m!443179))

(check-sat (not b!459640) (not b!459641) b_and!19309 (not b!459644) (not b!459638) (not start!41146) (not b!459648) (not b_next!11029) (not b!459652) (not b!459649) (not b!459637) tp_is_empty!12367 (not b_lambda!9877) (not mapNonEmpty!20200) (not b!459642) (not b!459651) (not b!459635))
(check-sat b_and!19309 (not b_next!11029))
