; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41054 () Bool)

(assert start!41054)

(declare-fun b_free!10981 () Bool)

(declare-fun b_next!10981 () Bool)

(assert (=> start!41054 (= b_free!10981 (not b_next!10981))))

(declare-fun tp!38772 () Bool)

(declare-fun b_and!19179 () Bool)

(assert (=> start!41054 (= tp!38772 b_and!19179)))

(declare-fun b!457977 () Bool)

(declare-fun res!273592 () Bool)

(declare-fun e!267405 () Bool)

(assert (=> b!457977 (=> (not res!273592) (not e!267405))))

(declare-datatypes ((array!28428 0))(
  ( (array!28429 (arr!13656 (Array (_ BitVec 32) (_ BitVec 64))) (size!14008 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28428)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457977 (= res!273592 (or (= (select (arr!13656 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13656 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457978 () Bool)

(declare-fun res!273600 () Bool)

(assert (=> b!457978 (=> (not res!273600) (not e!267405))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17531 0))(
  ( (V!17532 (val!6204 Int)) )
))
(declare-datatypes ((ValueCell!5816 0))(
  ( (ValueCellFull!5816 (v!8475 V!17531)) (EmptyCell!5816) )
))
(declare-datatypes ((array!28430 0))(
  ( (array!28431 (arr!13657 (Array (_ BitVec 32) ValueCell!5816)) (size!14009 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28430)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!457978 (= res!273600 (and (= (size!14009 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14008 _keys!709) (size!14009 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457979 () Bool)

(declare-fun e!267411 () Bool)

(assert (=> b!457979 (= e!267411 true)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8090 0))(
  ( (tuple2!8091 (_1!4056 (_ BitVec 64)) (_2!4056 V!17531)) )
))
(declare-datatypes ((List!8163 0))(
  ( (Nil!8160) (Cons!8159 (h!9015 tuple2!8090) (t!14015 List!8163)) )
))
(declare-datatypes ((ListLongMap!7005 0))(
  ( (ListLongMap!7006 (toList!3518 List!8163)) )
))
(declare-fun lt!207203 () ListLongMap!7005)

(declare-fun lt!207200 () ListLongMap!7005)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun +!1600 (ListLongMap!7005 tuple2!8090) ListLongMap!7005)

(declare-fun get!6733 (ValueCell!5816 V!17531) V!17531)

(declare-fun dynLambda!883 (Int (_ BitVec 64)) V!17531)

(assert (=> b!457979 (= lt!207200 (+!1600 lt!207203 (tuple2!8091 (select (arr!13656 _keys!709) from!863) (get!6733 (select (arr!13657 _values!549) from!863) (dynLambda!883 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457980 () Bool)

(declare-fun res!273596 () Bool)

(assert (=> b!457980 (=> (not res!273596) (not e!267405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28428 (_ BitVec 32)) Bool)

(assert (=> b!457980 (= res!273596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457981 () Bool)

(declare-fun res!273593 () Bool)

(declare-fun e!267410 () Bool)

(assert (=> b!457981 (=> (not res!273593) (not e!267410))))

(declare-fun lt!207204 () array!28428)

(declare-datatypes ((List!8164 0))(
  ( (Nil!8161) (Cons!8160 (h!9016 (_ BitVec 64)) (t!14016 List!8164)) )
))
(declare-fun arrayNoDuplicates!0 (array!28428 (_ BitVec 32) List!8164) Bool)

(assert (=> b!457981 (= res!273593 (arrayNoDuplicates!0 lt!207204 #b00000000000000000000000000000000 Nil!8161))))

(declare-fun mapIsEmpty!20122 () Bool)

(declare-fun mapRes!20122 () Bool)

(assert (=> mapIsEmpty!20122 mapRes!20122))

(declare-fun b!457982 () Bool)

(declare-fun e!267407 () Bool)

(assert (=> b!457982 (= e!267407 (not e!267411))))

(declare-fun res!273594 () Bool)

(assert (=> b!457982 (=> res!273594 e!267411)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457982 (= res!273594 (not (validKeyInArray!0 (select (arr!13656 _keys!709) from!863))))))

(declare-fun lt!207197 () ListLongMap!7005)

(assert (=> b!457982 (= lt!207197 lt!207203)))

(declare-fun lt!207202 () ListLongMap!7005)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17531)

(assert (=> b!457982 (= lt!207203 (+!1600 lt!207202 (tuple2!8091 k0!794 v!412)))))

(declare-fun minValue!515 () V!17531)

(declare-fun zeroValue!515 () V!17531)

(declare-fun lt!207199 () array!28430)

(declare-fun getCurrentListMapNoExtraKeys!1747 (array!28428 array!28430 (_ BitVec 32) (_ BitVec 32) V!17531 V!17531 (_ BitVec 32) Int) ListLongMap!7005)

(assert (=> b!457982 (= lt!207197 (getCurrentListMapNoExtraKeys!1747 lt!207204 lt!207199 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457982 (= lt!207202 (getCurrentListMapNoExtraKeys!1747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13303 0))(
  ( (Unit!13304) )
))
(declare-fun lt!207201 () Unit!13303)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!759 (array!28428 array!28430 (_ BitVec 32) (_ BitVec 32) V!17531 V!17531 (_ BitVec 32) (_ BitVec 64) V!17531 (_ BitVec 32) Int) Unit!13303)

(assert (=> b!457982 (= lt!207201 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!759 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457983 () Bool)

(declare-fun res!273598 () Bool)

(assert (=> b!457983 (=> (not res!273598) (not e!267405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457983 (= res!273598 (validMask!0 mask!1025))))

(declare-fun b!457984 () Bool)

(declare-fun e!267409 () Bool)

(declare-fun e!267408 () Bool)

(assert (=> b!457984 (= e!267409 (and e!267408 mapRes!20122))))

(declare-fun condMapEmpty!20122 () Bool)

(declare-fun mapDefault!20122 () ValueCell!5816)

(assert (=> b!457984 (= condMapEmpty!20122 (= (arr!13657 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5816)) mapDefault!20122)))))

(declare-fun b!457985 () Bool)

(declare-fun res!273602 () Bool)

(assert (=> b!457985 (=> (not res!273602) (not e!267410))))

(assert (=> b!457985 (= res!273602 (bvsle from!863 i!563))))

(declare-fun b!457986 () Bool)

(declare-fun res!273603 () Bool)

(assert (=> b!457986 (=> (not res!273603) (not e!267405))))

(assert (=> b!457986 (= res!273603 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14008 _keys!709))))))

(declare-fun b!457987 () Bool)

(declare-fun e!267404 () Bool)

(declare-fun tp_is_empty!12319 () Bool)

(assert (=> b!457987 (= e!267404 tp_is_empty!12319)))

(declare-fun b!457989 () Bool)

(declare-fun res!273604 () Bool)

(assert (=> b!457989 (=> (not res!273604) (not e!267405))))

(assert (=> b!457989 (= res!273604 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8161))))

(declare-fun b!457990 () Bool)

(assert (=> b!457990 (= e!267405 e!267410)))

(declare-fun res!273599 () Bool)

(assert (=> b!457990 (=> (not res!273599) (not e!267410))))

(assert (=> b!457990 (= res!273599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207204 mask!1025))))

(assert (=> b!457990 (= lt!207204 (array!28429 (store (arr!13656 _keys!709) i!563 k0!794) (size!14008 _keys!709)))))

(declare-fun b!457991 () Bool)

(declare-fun res!273597 () Bool)

(assert (=> b!457991 (=> (not res!273597) (not e!267405))))

(declare-fun arrayContainsKey!0 (array!28428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457991 (= res!273597 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457992 () Bool)

(assert (=> b!457992 (= e!267410 e!267407)))

(declare-fun res!273595 () Bool)

(assert (=> b!457992 (=> (not res!273595) (not e!267407))))

(assert (=> b!457992 (= res!273595 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!457992 (= lt!207200 (getCurrentListMapNoExtraKeys!1747 lt!207204 lt!207199 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457992 (= lt!207199 (array!28431 (store (arr!13657 _values!549) i!563 (ValueCellFull!5816 v!412)) (size!14009 _values!549)))))

(declare-fun lt!207198 () ListLongMap!7005)

(assert (=> b!457992 (= lt!207198 (getCurrentListMapNoExtraKeys!1747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!273601 () Bool)

(assert (=> start!41054 (=> (not res!273601) (not e!267405))))

(assert (=> start!41054 (= res!273601 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14008 _keys!709))))))

(assert (=> start!41054 e!267405))

(assert (=> start!41054 tp_is_empty!12319))

(assert (=> start!41054 tp!38772))

(assert (=> start!41054 true))

(declare-fun array_inv!9962 (array!28430) Bool)

(assert (=> start!41054 (and (array_inv!9962 _values!549) e!267409)))

(declare-fun array_inv!9963 (array!28428) Bool)

(assert (=> start!41054 (array_inv!9963 _keys!709)))

(declare-fun b!457988 () Bool)

(assert (=> b!457988 (= e!267408 tp_is_empty!12319)))

(declare-fun mapNonEmpty!20122 () Bool)

(declare-fun tp!38773 () Bool)

(assert (=> mapNonEmpty!20122 (= mapRes!20122 (and tp!38773 e!267404))))

(declare-fun mapKey!20122 () (_ BitVec 32))

(declare-fun mapValue!20122 () ValueCell!5816)

(declare-fun mapRest!20122 () (Array (_ BitVec 32) ValueCell!5816))

(assert (=> mapNonEmpty!20122 (= (arr!13657 _values!549) (store mapRest!20122 mapKey!20122 mapValue!20122))))

(declare-fun b!457993 () Bool)

(declare-fun res!273605 () Bool)

(assert (=> b!457993 (=> (not res!273605) (not e!267405))))

(assert (=> b!457993 (= res!273605 (validKeyInArray!0 k0!794))))

(assert (= (and start!41054 res!273601) b!457983))

(assert (= (and b!457983 res!273598) b!457978))

(assert (= (and b!457978 res!273600) b!457980))

(assert (= (and b!457980 res!273596) b!457989))

(assert (= (and b!457989 res!273604) b!457986))

(assert (= (and b!457986 res!273603) b!457993))

(assert (= (and b!457993 res!273605) b!457977))

(assert (= (and b!457977 res!273592) b!457991))

(assert (= (and b!457991 res!273597) b!457990))

(assert (= (and b!457990 res!273599) b!457981))

(assert (= (and b!457981 res!273593) b!457985))

(assert (= (and b!457985 res!273602) b!457992))

(assert (= (and b!457992 res!273595) b!457982))

(assert (= (and b!457982 (not res!273594)) b!457979))

(assert (= (and b!457984 condMapEmpty!20122) mapIsEmpty!20122))

(assert (= (and b!457984 (not condMapEmpty!20122)) mapNonEmpty!20122))

(get-info :version)

(assert (= (and mapNonEmpty!20122 ((_ is ValueCellFull!5816) mapValue!20122)) b!457987))

(assert (= (and b!457984 ((_ is ValueCellFull!5816) mapDefault!20122)) b!457988))

(assert (= start!41054 b!457984))

(declare-fun b_lambda!9761 () Bool)

(assert (=> (not b_lambda!9761) (not b!457979)))

(declare-fun t!14014 () Bool)

(declare-fun tb!3809 () Bool)

(assert (=> (and start!41054 (= defaultEntry!557 defaultEntry!557) t!14014) tb!3809))

(declare-fun result!7167 () Bool)

(assert (=> tb!3809 (= result!7167 tp_is_empty!12319)))

(assert (=> b!457979 t!14014))

(declare-fun b_and!19181 () Bool)

(assert (= b_and!19179 (and (=> t!14014 result!7167) b_and!19181)))

(declare-fun m!441543 () Bool)

(assert (=> mapNonEmpty!20122 m!441543))

(declare-fun m!441545 () Bool)

(assert (=> start!41054 m!441545))

(declare-fun m!441547 () Bool)

(assert (=> start!41054 m!441547))

(declare-fun m!441549 () Bool)

(assert (=> b!457992 m!441549))

(declare-fun m!441551 () Bool)

(assert (=> b!457992 m!441551))

(declare-fun m!441553 () Bool)

(assert (=> b!457992 m!441553))

(declare-fun m!441555 () Bool)

(assert (=> b!457979 m!441555))

(declare-fun m!441557 () Bool)

(assert (=> b!457979 m!441557))

(declare-fun m!441559 () Bool)

(assert (=> b!457979 m!441559))

(declare-fun m!441561 () Bool)

(assert (=> b!457979 m!441561))

(assert (=> b!457979 m!441559))

(assert (=> b!457979 m!441557))

(declare-fun m!441563 () Bool)

(assert (=> b!457979 m!441563))

(declare-fun m!441565 () Bool)

(assert (=> b!457981 m!441565))

(declare-fun m!441567 () Bool)

(assert (=> b!457990 m!441567))

(declare-fun m!441569 () Bool)

(assert (=> b!457990 m!441569))

(assert (=> b!457982 m!441555))

(declare-fun m!441571 () Bool)

(assert (=> b!457982 m!441571))

(declare-fun m!441573 () Bool)

(assert (=> b!457982 m!441573))

(declare-fun m!441575 () Bool)

(assert (=> b!457982 m!441575))

(assert (=> b!457982 m!441555))

(declare-fun m!441577 () Bool)

(assert (=> b!457982 m!441577))

(declare-fun m!441579 () Bool)

(assert (=> b!457982 m!441579))

(declare-fun m!441581 () Bool)

(assert (=> b!457980 m!441581))

(declare-fun m!441583 () Bool)

(assert (=> b!457983 m!441583))

(declare-fun m!441585 () Bool)

(assert (=> b!457991 m!441585))

(declare-fun m!441587 () Bool)

(assert (=> b!457993 m!441587))

(declare-fun m!441589 () Bool)

(assert (=> b!457977 m!441589))

(declare-fun m!441591 () Bool)

(assert (=> b!457989 m!441591))

(check-sat (not b!457980) b_and!19181 (not b!457993) (not b_next!10981) (not b!457981) (not start!41054) (not b!457982) (not mapNonEmpty!20122) (not b_lambda!9761) (not b!457990) (not b!457979) tp_is_empty!12319 (not b!457983) (not b!457991) (not b!457989) (not b!457992))
(check-sat b_and!19181 (not b_next!10981))
