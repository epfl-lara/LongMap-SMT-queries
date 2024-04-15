; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41128 () Bool)

(assert start!41128)

(declare-fun b_free!11011 () Bool)

(declare-fun b_next!11011 () Bool)

(assert (=> start!41128 (= b_free!11011 (not b_next!11011))))

(declare-fun tp!38869 () Bool)

(declare-fun b_and!19235 () Bool)

(assert (=> start!41128 (= tp!38869 b_and!19235)))

(declare-fun b!458894 () Bool)

(declare-datatypes ((Unit!13307 0))(
  ( (Unit!13308) )
))
(declare-fun e!267852 () Unit!13307)

(declare-fun Unit!13309 () Unit!13307)

(assert (=> b!458894 (= e!267852 Unit!13309)))

(declare-fun b!458895 () Bool)

(declare-fun res!274247 () Bool)

(declare-fun e!267858 () Bool)

(assert (=> b!458895 (=> (not res!274247) (not e!267858))))

(declare-datatypes ((array!28495 0))(
  ( (array!28496 (arr!13688 (Array (_ BitVec 32) (_ BitVec 64))) (size!14041 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28495)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458895 (= res!274247 (or (= (select (arr!13688 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13688 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458896 () Bool)

(declare-fun res!274249 () Bool)

(assert (=> b!458896 (=> (not res!274249) (not e!267858))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458896 (= res!274249 (validKeyInArray!0 k0!794))))

(declare-fun b!458897 () Bool)

(declare-fun e!267857 () Bool)

(declare-fun e!267856 () Bool)

(assert (=> b!458897 (= e!267857 (not e!267856))))

(declare-fun res!274245 () Bool)

(assert (=> b!458897 (=> res!274245 e!267856)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!458897 (= res!274245 (not (validKeyInArray!0 (select (arr!13688 _keys!709) from!863))))))

(declare-datatypes ((V!17571 0))(
  ( (V!17572 (val!6219 Int)) )
))
(declare-datatypes ((tuple2!8224 0))(
  ( (tuple2!8225 (_1!4123 (_ BitVec 64)) (_2!4123 V!17571)) )
))
(declare-datatypes ((List!8287 0))(
  ( (Nil!8284) (Cons!8283 (h!9139 tuple2!8224) (t!14168 List!8287)) )
))
(declare-datatypes ((ListLongMap!7127 0))(
  ( (ListLongMap!7128 (toList!3579 List!8287)) )
))
(declare-fun lt!207494 () ListLongMap!7127)

(declare-fun lt!207491 () ListLongMap!7127)

(assert (=> b!458897 (= lt!207494 lt!207491)))

(declare-fun v!412 () V!17571)

(declare-fun lt!207492 () ListLongMap!7127)

(declare-fun +!1631 (ListLongMap!7127 tuple2!8224) ListLongMap!7127)

(assert (=> b!458897 (= lt!207491 (+!1631 lt!207492 (tuple2!8225 k0!794 v!412)))))

(declare-fun lt!207490 () array!28495)

(declare-fun minValue!515 () V!17571)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5831 0))(
  ( (ValueCellFull!5831 (v!8491 V!17571)) (EmptyCell!5831) )
))
(declare-datatypes ((array!28497 0))(
  ( (array!28498 (arr!13689 (Array (_ BitVec 32) ValueCell!5831)) (size!14042 (_ BitVec 32))) )
))
(declare-fun lt!207488 () array!28497)

(declare-fun zeroValue!515 () V!17571)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1773 (array!28495 array!28497 (_ BitVec 32) (_ BitVec 32) V!17571 V!17571 (_ BitVec 32) Int) ListLongMap!7127)

(assert (=> b!458897 (= lt!207494 (getCurrentListMapNoExtraKeys!1773 lt!207490 lt!207488 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28497)

(assert (=> b!458897 (= lt!207492 (getCurrentListMapNoExtraKeys!1773 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!207497 () Unit!13307)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!765 (array!28495 array!28497 (_ BitVec 32) (_ BitVec 32) V!17571 V!17571 (_ BitVec 32) (_ BitVec 64) V!17571 (_ BitVec 32) Int) Unit!13307)

(assert (=> b!458897 (= lt!207497 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!765 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458898 () Bool)

(declare-fun res!274254 () Bool)

(declare-fun e!267855 () Bool)

(assert (=> b!458898 (=> (not res!274254) (not e!267855))))

(assert (=> b!458898 (= res!274254 (bvsle from!863 i!563))))

(declare-fun b!458899 () Bool)

(declare-fun Unit!13310 () Unit!13307)

(assert (=> b!458899 (= e!267852 Unit!13310)))

(declare-fun lt!207493 () Unit!13307)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28495 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13307)

(assert (=> b!458899 (= lt!207493 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!458899 false))

(declare-fun b!458900 () Bool)

(assert (=> b!458900 (= e!267856 (not (= (select (arr!13688 _keys!709) from!863) k0!794)))))

(declare-fun lt!207489 () Unit!13307)

(assert (=> b!458900 (= lt!207489 e!267852)))

(declare-fun c!56394 () Bool)

(assert (=> b!458900 (= c!56394 (= (select (arr!13688 _keys!709) from!863) k0!794))))

(declare-fun lt!207496 () ListLongMap!7127)

(declare-fun get!6753 (ValueCell!5831 V!17571) V!17571)

(declare-fun dynLambda!892 (Int (_ BitVec 64)) V!17571)

(assert (=> b!458900 (= lt!207496 (+!1631 lt!207491 (tuple2!8225 (select (arr!13688 _keys!709) from!863) (get!6753 (select (arr!13689 _values!549) from!863) (dynLambda!892 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458901 () Bool)

(declare-fun e!267853 () Bool)

(declare-fun tp_is_empty!12349 () Bool)

(assert (=> b!458901 (= e!267853 tp_is_empty!12349)))

(declare-fun mapNonEmpty!20173 () Bool)

(declare-fun mapRes!20173 () Bool)

(declare-fun tp!38868 () Bool)

(declare-fun e!267850 () Bool)

(assert (=> mapNonEmpty!20173 (= mapRes!20173 (and tp!38868 e!267850))))

(declare-fun mapRest!20173 () (Array (_ BitVec 32) ValueCell!5831))

(declare-fun mapKey!20173 () (_ BitVec 32))

(declare-fun mapValue!20173 () ValueCell!5831)

(assert (=> mapNonEmpty!20173 (= (arr!13689 _values!549) (store mapRest!20173 mapKey!20173 mapValue!20173))))

(declare-fun b!458902 () Bool)

(declare-fun res!274252 () Bool)

(assert (=> b!458902 (=> (not res!274252) (not e!267858))))

(declare-datatypes ((List!8288 0))(
  ( (Nil!8285) (Cons!8284 (h!9140 (_ BitVec 64)) (t!14169 List!8288)) )
))
(declare-fun arrayNoDuplicates!0 (array!28495 (_ BitVec 32) List!8288) Bool)

(assert (=> b!458902 (= res!274252 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8285))))

(declare-fun b!458903 () Bool)

(declare-fun res!274244 () Bool)

(assert (=> b!458903 (=> (not res!274244) (not e!267858))))

(assert (=> b!458903 (= res!274244 (and (= (size!14042 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14041 _keys!709) (size!14042 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458904 () Bool)

(declare-fun res!274242 () Bool)

(assert (=> b!458904 (=> (not res!274242) (not e!267858))))

(declare-fun arrayContainsKey!0 (array!28495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458904 (= res!274242 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!458905 () Bool)

(assert (=> b!458905 (= e!267850 tp_is_empty!12349)))

(declare-fun mapIsEmpty!20173 () Bool)

(assert (=> mapIsEmpty!20173 mapRes!20173))

(declare-fun res!274248 () Bool)

(assert (=> start!41128 (=> (not res!274248) (not e!267858))))

(assert (=> start!41128 (= res!274248 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14041 _keys!709))))))

(assert (=> start!41128 e!267858))

(assert (=> start!41128 tp_is_empty!12349))

(assert (=> start!41128 tp!38869))

(assert (=> start!41128 true))

(declare-fun e!267854 () Bool)

(declare-fun array_inv!9966 (array!28497) Bool)

(assert (=> start!41128 (and (array_inv!9966 _values!549) e!267854)))

(declare-fun array_inv!9967 (array!28495) Bool)

(assert (=> start!41128 (array_inv!9967 _keys!709)))

(declare-fun b!458906 () Bool)

(declare-fun res!274251 () Bool)

(assert (=> b!458906 (=> (not res!274251) (not e!267858))))

(assert (=> b!458906 (= res!274251 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14041 _keys!709))))))

(declare-fun b!458907 () Bool)

(declare-fun res!274243 () Bool)

(assert (=> b!458907 (=> (not res!274243) (not e!267858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28495 (_ BitVec 32)) Bool)

(assert (=> b!458907 (= res!274243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458908 () Bool)

(declare-fun res!274253 () Bool)

(assert (=> b!458908 (=> (not res!274253) (not e!267855))))

(assert (=> b!458908 (= res!274253 (arrayNoDuplicates!0 lt!207490 #b00000000000000000000000000000000 Nil!8285))))

(declare-fun b!458909 () Bool)

(declare-fun res!274255 () Bool)

(assert (=> b!458909 (=> (not res!274255) (not e!267858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458909 (= res!274255 (validMask!0 mask!1025))))

(declare-fun b!458910 () Bool)

(assert (=> b!458910 (= e!267858 e!267855)))

(declare-fun res!274250 () Bool)

(assert (=> b!458910 (=> (not res!274250) (not e!267855))))

(assert (=> b!458910 (= res!274250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207490 mask!1025))))

(assert (=> b!458910 (= lt!207490 (array!28496 (store (arr!13688 _keys!709) i!563 k0!794) (size!14041 _keys!709)))))

(declare-fun b!458911 () Bool)

(assert (=> b!458911 (= e!267854 (and e!267853 mapRes!20173))))

(declare-fun condMapEmpty!20173 () Bool)

(declare-fun mapDefault!20173 () ValueCell!5831)

(assert (=> b!458911 (= condMapEmpty!20173 (= (arr!13689 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5831)) mapDefault!20173)))))

(declare-fun b!458912 () Bool)

(assert (=> b!458912 (= e!267855 e!267857)))

(declare-fun res!274246 () Bool)

(assert (=> b!458912 (=> (not res!274246) (not e!267857))))

(assert (=> b!458912 (= res!274246 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!458912 (= lt!207496 (getCurrentListMapNoExtraKeys!1773 lt!207490 lt!207488 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!458912 (= lt!207488 (array!28498 (store (arr!13689 _values!549) i!563 (ValueCellFull!5831 v!412)) (size!14042 _values!549)))))

(declare-fun lt!207495 () ListLongMap!7127)

(assert (=> b!458912 (= lt!207495 (getCurrentListMapNoExtraKeys!1773 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!41128 res!274248) b!458909))

(assert (= (and b!458909 res!274255) b!458903))

(assert (= (and b!458903 res!274244) b!458907))

(assert (= (and b!458907 res!274243) b!458902))

(assert (= (and b!458902 res!274252) b!458906))

(assert (= (and b!458906 res!274251) b!458896))

(assert (= (and b!458896 res!274249) b!458895))

(assert (= (and b!458895 res!274247) b!458904))

(assert (= (and b!458904 res!274242) b!458910))

(assert (= (and b!458910 res!274250) b!458908))

(assert (= (and b!458908 res!274253) b!458898))

(assert (= (and b!458898 res!274254) b!458912))

(assert (= (and b!458912 res!274246) b!458897))

(assert (= (and b!458897 (not res!274245)) b!458900))

(assert (= (and b!458900 c!56394) b!458899))

(assert (= (and b!458900 (not c!56394)) b!458894))

(assert (= (and b!458911 condMapEmpty!20173) mapIsEmpty!20173))

(assert (= (and b!458911 (not condMapEmpty!20173)) mapNonEmpty!20173))

(get-info :version)

(assert (= (and mapNonEmpty!20173 ((_ is ValueCellFull!5831) mapValue!20173)) b!458905))

(assert (= (and b!458911 ((_ is ValueCellFull!5831) mapDefault!20173)) b!458901))

(assert (= start!41128 b!458911))

(declare-fun b_lambda!9827 () Bool)

(assert (=> (not b_lambda!9827) (not b!458900)))

(declare-fun t!14167 () Bool)

(declare-fun tb!3839 () Bool)

(assert (=> (and start!41128 (= defaultEntry!557 defaultEntry!557) t!14167) tb!3839))

(declare-fun result!7231 () Bool)

(assert (=> tb!3839 (= result!7231 tp_is_empty!12349)))

(assert (=> b!458900 t!14167))

(declare-fun b_and!19237 () Bool)

(assert (= b_and!19235 (and (=> t!14167 result!7231) b_and!19237)))

(declare-fun m!441745 () Bool)

(assert (=> b!458900 m!441745))

(declare-fun m!441747 () Bool)

(assert (=> b!458900 m!441747))

(declare-fun m!441749 () Bool)

(assert (=> b!458900 m!441749))

(declare-fun m!441751 () Bool)

(assert (=> b!458900 m!441751))

(assert (=> b!458900 m!441749))

(assert (=> b!458900 m!441747))

(declare-fun m!441753 () Bool)

(assert (=> b!458900 m!441753))

(declare-fun m!441755 () Bool)

(assert (=> b!458907 m!441755))

(assert (=> b!458897 m!441745))

(declare-fun m!441757 () Bool)

(assert (=> b!458897 m!441757))

(declare-fun m!441759 () Bool)

(assert (=> b!458897 m!441759))

(declare-fun m!441761 () Bool)

(assert (=> b!458897 m!441761))

(assert (=> b!458897 m!441745))

(declare-fun m!441763 () Bool)

(assert (=> b!458897 m!441763))

(declare-fun m!441765 () Bool)

(assert (=> b!458897 m!441765))

(declare-fun m!441767 () Bool)

(assert (=> b!458896 m!441767))

(declare-fun m!441769 () Bool)

(assert (=> b!458895 m!441769))

(declare-fun m!441771 () Bool)

(assert (=> b!458912 m!441771))

(declare-fun m!441773 () Bool)

(assert (=> b!458912 m!441773))

(declare-fun m!441775 () Bool)

(assert (=> b!458912 m!441775))

(declare-fun m!441777 () Bool)

(assert (=> mapNonEmpty!20173 m!441777))

(declare-fun m!441779 () Bool)

(assert (=> b!458910 m!441779))

(declare-fun m!441781 () Bool)

(assert (=> b!458910 m!441781))

(declare-fun m!441783 () Bool)

(assert (=> b!458909 m!441783))

(declare-fun m!441785 () Bool)

(assert (=> b!458899 m!441785))

(declare-fun m!441787 () Bool)

(assert (=> b!458904 m!441787))

(declare-fun m!441789 () Bool)

(assert (=> b!458902 m!441789))

(declare-fun m!441791 () Bool)

(assert (=> start!41128 m!441791))

(declare-fun m!441793 () Bool)

(assert (=> start!41128 m!441793))

(declare-fun m!441795 () Bool)

(assert (=> b!458908 m!441795))

(check-sat (not b!458910) (not b!458899) (not b_next!11011) tp_is_empty!12349 (not b!458909) (not b!458907) (not b!458897) (not b!458900) (not b!458896) (not b!458908) (not b_lambda!9827) (not b!458912) (not start!41128) (not b!458904) b_and!19237 (not b!458902) (not mapNonEmpty!20173))
(check-sat b_and!19237 (not b_next!11011))
