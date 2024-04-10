; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40970 () Bool)

(assert start!40970)

(declare-fun b_free!10905 () Bool)

(declare-fun b_next!10905 () Bool)

(assert (=> start!40970 (= b_free!10905 (not b_next!10905))))

(declare-fun tp!38542 () Bool)

(declare-fun b_and!19047 () Bool)

(assert (=> start!40970 (= tp!38542 b_and!19047)))

(declare-fun b!455987 () Bool)

(declare-fun e!266499 () Bool)

(declare-fun e!266498 () Bool)

(declare-fun mapRes!20005 () Bool)

(assert (=> b!455987 (= e!266499 (and e!266498 mapRes!20005))))

(declare-fun condMapEmpty!20005 () Bool)

(declare-datatypes ((V!17429 0))(
  ( (V!17430 (val!6166 Int)) )
))
(declare-datatypes ((ValueCell!5778 0))(
  ( (ValueCellFull!5778 (v!8432 V!17429)) (EmptyCell!5778) )
))
(declare-datatypes ((array!28289 0))(
  ( (array!28290 (arr!13588 (Array (_ BitVec 32) ValueCell!5778)) (size!13940 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28289)

(declare-fun mapDefault!20005 () ValueCell!5778)

(assert (=> b!455987 (= condMapEmpty!20005 (= (arr!13588 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5778)) mapDefault!20005)))))

(declare-fun b!455988 () Bool)

(declare-fun res!272015 () Bool)

(declare-fun e!266502 () Bool)

(assert (=> b!455988 (=> (not res!272015) (not e!266502))))

(declare-datatypes ((array!28291 0))(
  ( (array!28292 (arr!13589 (Array (_ BitVec 32) (_ BitVec 64))) (size!13941 (_ BitVec 32))) )
))
(declare-fun lt!206447 () array!28291)

(declare-datatypes ((List!8194 0))(
  ( (Nil!8191) (Cons!8190 (h!9046 (_ BitVec 64)) (t!14022 List!8194)) )
))
(declare-fun arrayNoDuplicates!0 (array!28291 (_ BitVec 32) List!8194) Bool)

(assert (=> b!455988 (= res!272015 (arrayNoDuplicates!0 lt!206447 #b00000000000000000000000000000000 Nil!8191))))

(declare-fun b!455989 () Bool)

(declare-fun res!272008 () Bool)

(declare-fun e!266500 () Bool)

(assert (=> b!455989 (=> (not res!272008) (not e!266500))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455989 (= res!272008 (validMask!0 mask!1025))))

(declare-fun b!455990 () Bool)

(declare-fun tp_is_empty!12243 () Bool)

(assert (=> b!455990 (= e!266498 tp_is_empty!12243)))

(declare-fun b!455991 () Bool)

(declare-fun res!272007 () Bool)

(assert (=> b!455991 (=> (not res!272007) (not e!266500))))

(declare-fun _keys!709 () array!28291)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28291 (_ BitVec 32)) Bool)

(assert (=> b!455991 (= res!272007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455992 () Bool)

(declare-fun res!272014 () Bool)

(assert (=> b!455992 (=> (not res!272014) (not e!266500))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455992 (= res!272014 (or (= (select (arr!13589 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13589 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20005 () Bool)

(assert (=> mapIsEmpty!20005 mapRes!20005))

(declare-fun b!455993 () Bool)

(assert (=> b!455993 (= e!266500 e!266502)))

(declare-fun res!272012 () Bool)

(assert (=> b!455993 (=> (not res!272012) (not e!266502))))

(assert (=> b!455993 (= res!272012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206447 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!455993 (= lt!206447 (array!28292 (store (arr!13589 _keys!709) i!563 k0!794) (size!13941 _keys!709)))))

(declare-fun b!455994 () Bool)

(declare-fun e!266503 () Bool)

(assert (=> b!455994 (= e!266503 tp_is_empty!12243)))

(declare-fun b!455995 () Bool)

(declare-fun res!272009 () Bool)

(assert (=> b!455995 (=> (not res!272009) (not e!266500))))

(assert (=> b!455995 (= res!272009 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13941 _keys!709))))))

(declare-fun b!455997 () Bool)

(declare-fun res!272004 () Bool)

(assert (=> b!455997 (=> (not res!272004) (not e!266500))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!455997 (= res!272004 (and (= (size!13940 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13941 _keys!709) (size!13940 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455998 () Bool)

(declare-fun res!272005 () Bool)

(assert (=> b!455998 (=> (not res!272005) (not e!266500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455998 (= res!272005 (validKeyInArray!0 k0!794))))

(declare-fun b!455999 () Bool)

(declare-fun res!272011 () Bool)

(assert (=> b!455999 (=> (not res!272011) (not e!266502))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!455999 (= res!272011 (bvsle from!863 i!563))))

(declare-fun b!456000 () Bool)

(declare-fun res!272013 () Bool)

(assert (=> b!456000 (=> (not res!272013) (not e!266500))))

(declare-fun arrayContainsKey!0 (array!28291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456000 (= res!272013 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455996 () Bool)

(assert (=> b!455996 (= e!266502 false)))

(declare-fun minValue!515 () V!17429)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17429)

(declare-datatypes ((tuple2!8124 0))(
  ( (tuple2!8125 (_1!4073 (_ BitVec 64)) (_2!4073 V!17429)) )
))
(declare-datatypes ((List!8195 0))(
  ( (Nil!8192) (Cons!8191 (h!9047 tuple2!8124) (t!14023 List!8195)) )
))
(declare-datatypes ((ListLongMap!7037 0))(
  ( (ListLongMap!7038 (toList!3534 List!8195)) )
))
(declare-fun lt!206446 () ListLongMap!7037)

(declare-fun v!412 () V!17429)

(declare-fun getCurrentListMapNoExtraKeys!1717 (array!28291 array!28289 (_ BitVec 32) (_ BitVec 32) V!17429 V!17429 (_ BitVec 32) Int) ListLongMap!7037)

(assert (=> b!455996 (= lt!206446 (getCurrentListMapNoExtraKeys!1717 lt!206447 (array!28290 (store (arr!13588 _values!549) i!563 (ValueCellFull!5778 v!412)) (size!13940 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206445 () ListLongMap!7037)

(assert (=> b!455996 (= lt!206445 (getCurrentListMapNoExtraKeys!1717 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!272006 () Bool)

(assert (=> start!40970 (=> (not res!272006) (not e!266500))))

(assert (=> start!40970 (= res!272006 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13941 _keys!709))))))

(assert (=> start!40970 e!266500))

(assert (=> start!40970 tp_is_empty!12243))

(assert (=> start!40970 tp!38542))

(assert (=> start!40970 true))

(declare-fun array_inv!9850 (array!28289) Bool)

(assert (=> start!40970 (and (array_inv!9850 _values!549) e!266499)))

(declare-fun array_inv!9851 (array!28291) Bool)

(assert (=> start!40970 (array_inv!9851 _keys!709)))

(declare-fun mapNonEmpty!20005 () Bool)

(declare-fun tp!38541 () Bool)

(assert (=> mapNonEmpty!20005 (= mapRes!20005 (and tp!38541 e!266503))))

(declare-fun mapValue!20005 () ValueCell!5778)

(declare-fun mapRest!20005 () (Array (_ BitVec 32) ValueCell!5778))

(declare-fun mapKey!20005 () (_ BitVec 32))

(assert (=> mapNonEmpty!20005 (= (arr!13588 _values!549) (store mapRest!20005 mapKey!20005 mapValue!20005))))

(declare-fun b!456001 () Bool)

(declare-fun res!272010 () Bool)

(assert (=> b!456001 (=> (not res!272010) (not e!266500))))

(assert (=> b!456001 (= res!272010 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8191))))

(assert (= (and start!40970 res!272006) b!455989))

(assert (= (and b!455989 res!272008) b!455997))

(assert (= (and b!455997 res!272004) b!455991))

(assert (= (and b!455991 res!272007) b!456001))

(assert (= (and b!456001 res!272010) b!455995))

(assert (= (and b!455995 res!272009) b!455998))

(assert (= (and b!455998 res!272005) b!455992))

(assert (= (and b!455992 res!272014) b!456000))

(assert (= (and b!456000 res!272013) b!455993))

(assert (= (and b!455993 res!272012) b!455988))

(assert (= (and b!455988 res!272015) b!455999))

(assert (= (and b!455999 res!272011) b!455996))

(assert (= (and b!455987 condMapEmpty!20005) mapIsEmpty!20005))

(assert (= (and b!455987 (not condMapEmpty!20005)) mapNonEmpty!20005))

(get-info :version)

(assert (= (and mapNonEmpty!20005 ((_ is ValueCellFull!5778) mapValue!20005)) b!455994))

(assert (= (and b!455987 ((_ is ValueCellFull!5778) mapDefault!20005)) b!455990))

(assert (= start!40970 b!455987))

(declare-fun m!439591 () Bool)

(assert (=> b!455993 m!439591))

(declare-fun m!439593 () Bool)

(assert (=> b!455993 m!439593))

(declare-fun m!439595 () Bool)

(assert (=> start!40970 m!439595))

(declare-fun m!439597 () Bool)

(assert (=> start!40970 m!439597))

(declare-fun m!439599 () Bool)

(assert (=> b!455989 m!439599))

(declare-fun m!439601 () Bool)

(assert (=> b!455991 m!439601))

(declare-fun m!439603 () Bool)

(assert (=> b!456001 m!439603))

(declare-fun m!439605 () Bool)

(assert (=> mapNonEmpty!20005 m!439605))

(declare-fun m!439607 () Bool)

(assert (=> b!456000 m!439607))

(declare-fun m!439609 () Bool)

(assert (=> b!455998 m!439609))

(declare-fun m!439611 () Bool)

(assert (=> b!455992 m!439611))

(declare-fun m!439613 () Bool)

(assert (=> b!455988 m!439613))

(declare-fun m!439615 () Bool)

(assert (=> b!455996 m!439615))

(declare-fun m!439617 () Bool)

(assert (=> b!455996 m!439617))

(declare-fun m!439619 () Bool)

(assert (=> b!455996 m!439619))

(check-sat (not b!455993) (not mapNonEmpty!20005) (not start!40970) (not b!455989) (not b!455988) (not b!456000) (not b!455996) tp_is_empty!12243 (not b!455991) b_and!19047 (not b_next!10905) (not b!455998) (not b!456001))
(check-sat b_and!19047 (not b_next!10905))
