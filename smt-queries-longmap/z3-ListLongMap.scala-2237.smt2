; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36870 () Bool)

(assert start!36870)

(declare-fun b_free!8011 () Bool)

(declare-fun b_next!8011 () Bool)

(assert (=> start!36870 (= b_free!8011 (not b_next!8011))))

(declare-fun tp!28749 () Bool)

(declare-fun b_and!15267 () Bool)

(assert (=> start!36870 (= tp!28749 b_and!15267)))

(declare-fun b!369205 () Bool)

(declare-fun res!207108 () Bool)

(declare-fun e!225680 () Bool)

(assert (=> b!369205 (=> (not res!207108) (not e!225680))))

(declare-datatypes ((array!21250 0))(
  ( (array!21251 (arr!10093 (Array (_ BitVec 32) (_ BitVec 64))) (size!10445 (_ BitVec 32))) )
))
(declare-fun lt!169713 () array!21250)

(declare-datatypes ((List!5536 0))(
  ( (Nil!5533) (Cons!5532 (h!6388 (_ BitVec 64)) (t!10678 List!5536)) )
))
(declare-fun arrayNoDuplicates!0 (array!21250 (_ BitVec 32) List!5536) Bool)

(assert (=> b!369205 (= res!207108 (arrayNoDuplicates!0 lt!169713 #b00000000000000000000000000000000 Nil!5533))))

(declare-fun b!369206 () Bool)

(declare-fun res!207114 () Bool)

(declare-fun e!225681 () Bool)

(assert (=> b!369206 (=> (not res!207114) (not e!225681))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369206 (= res!207114 (validKeyInArray!0 k0!778))))

(declare-fun b!369207 () Bool)

(assert (=> b!369207 (= e!225681 e!225680)))

(declare-fun res!207110 () Bool)

(assert (=> b!369207 (=> (not res!207110) (not e!225680))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21250 (_ BitVec 32)) Bool)

(assert (=> b!369207 (= res!207110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169713 mask!970))))

(declare-fun _keys!658 () array!21250)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369207 (= lt!169713 (array!21251 (store (arr!10093 _keys!658) i!548 k0!778) (size!10445 _keys!658)))))

(declare-fun b!369208 () Bool)

(declare-fun res!207113 () Bool)

(assert (=> b!369208 (=> (not res!207113) (not e!225681))))

(assert (=> b!369208 (= res!207113 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10445 _keys!658))))))

(declare-fun b!369209 () Bool)

(declare-fun e!225679 () Bool)

(declare-fun tp_is_empty!8659 () Bool)

(assert (=> b!369209 (= e!225679 tp_is_empty!8659)))

(declare-fun res!207107 () Bool)

(assert (=> start!36870 (=> (not res!207107) (not e!225681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36870 (= res!207107 (validMask!0 mask!970))))

(assert (=> start!36870 e!225681))

(declare-datatypes ((V!12651 0))(
  ( (V!12652 (val!4374 Int)) )
))
(declare-datatypes ((ValueCell!3986 0))(
  ( (ValueCellFull!3986 (v!6572 V!12651)) (EmptyCell!3986) )
))
(declare-datatypes ((array!21252 0))(
  ( (array!21253 (arr!10094 (Array (_ BitVec 32) ValueCell!3986)) (size!10446 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21252)

(declare-fun e!225676 () Bool)

(declare-fun array_inv!7488 (array!21252) Bool)

(assert (=> start!36870 (and (array_inv!7488 _values!506) e!225676)))

(assert (=> start!36870 tp!28749))

(assert (=> start!36870 true))

(assert (=> start!36870 tp_is_empty!8659))

(declare-fun array_inv!7489 (array!21250) Bool)

(assert (=> start!36870 (array_inv!7489 _keys!658)))

(declare-fun b!369210 () Bool)

(declare-fun res!207112 () Bool)

(assert (=> b!369210 (=> (not res!207112) (not e!225681))))

(assert (=> b!369210 (= res!207112 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5533))))

(declare-fun b!369211 () Bool)

(declare-fun res!207109 () Bool)

(assert (=> b!369211 (=> (not res!207109) (not e!225681))))

(assert (=> b!369211 (= res!207109 (or (= (select (arr!10093 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10093 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369212 () Bool)

(declare-fun res!207111 () Bool)

(assert (=> b!369212 (=> (not res!207111) (not e!225681))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369212 (= res!207111 (and (= (size!10446 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10445 _keys!658) (size!10446 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14553 () Bool)

(declare-fun mapRes!14553 () Bool)

(assert (=> mapIsEmpty!14553 mapRes!14553))

(declare-fun b!369213 () Bool)

(assert (=> b!369213 (= e!225676 (and e!225679 mapRes!14553))))

(declare-fun condMapEmpty!14553 () Bool)

(declare-fun mapDefault!14553 () ValueCell!3986)

(assert (=> b!369213 (= condMapEmpty!14553 (= (arr!10094 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3986)) mapDefault!14553)))))

(declare-fun b!369214 () Bool)

(declare-fun e!225678 () Bool)

(assert (=> b!369214 (= e!225678 tp_is_empty!8659)))

(declare-fun mapNonEmpty!14553 () Bool)

(declare-fun tp!28748 () Bool)

(assert (=> mapNonEmpty!14553 (= mapRes!14553 (and tp!28748 e!225678))))

(declare-fun mapRest!14553 () (Array (_ BitVec 32) ValueCell!3986))

(declare-fun mapKey!14553 () (_ BitVec 32))

(declare-fun mapValue!14553 () ValueCell!3986)

(assert (=> mapNonEmpty!14553 (= (arr!10094 _values!506) (store mapRest!14553 mapKey!14553 mapValue!14553))))

(declare-fun b!369215 () Bool)

(declare-fun res!207115 () Bool)

(assert (=> b!369215 (=> (not res!207115) (not e!225681))))

(declare-fun arrayContainsKey!0 (array!21250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369215 (= res!207115 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369216 () Bool)

(declare-fun res!207116 () Bool)

(assert (=> b!369216 (=> (not res!207116) (not e!225681))))

(assert (=> b!369216 (= res!207116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369217 () Bool)

(assert (=> b!369217 (= e!225680 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12651)

(declare-datatypes ((tuple2!5710 0))(
  ( (tuple2!5711 (_1!2866 (_ BitVec 64)) (_2!2866 V!12651)) )
))
(declare-datatypes ((List!5537 0))(
  ( (Nil!5534) (Cons!5533 (h!6389 tuple2!5710) (t!10679 List!5537)) )
))
(declare-datatypes ((ListLongMap!4625 0))(
  ( (ListLongMap!4626 (toList!2328 List!5537)) )
))
(declare-fun lt!169714 () ListLongMap!4625)

(declare-fun v!373 () V!12651)

(declare-fun minValue!472 () V!12651)

(declare-fun getCurrentListMapNoExtraKeys!637 (array!21250 array!21252 (_ BitVec 32) (_ BitVec 32) V!12651 V!12651 (_ BitVec 32) Int) ListLongMap!4625)

(assert (=> b!369217 (= lt!169714 (getCurrentListMapNoExtraKeys!637 lt!169713 (array!21253 (store (arr!10094 _values!506) i!548 (ValueCellFull!3986 v!373)) (size!10446 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169712 () ListLongMap!4625)

(assert (=> b!369217 (= lt!169712 (getCurrentListMapNoExtraKeys!637 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!36870 res!207107) b!369212))

(assert (= (and b!369212 res!207111) b!369216))

(assert (= (and b!369216 res!207116) b!369210))

(assert (= (and b!369210 res!207112) b!369208))

(assert (= (and b!369208 res!207113) b!369206))

(assert (= (and b!369206 res!207114) b!369211))

(assert (= (and b!369211 res!207109) b!369215))

(assert (= (and b!369215 res!207115) b!369207))

(assert (= (and b!369207 res!207110) b!369205))

(assert (= (and b!369205 res!207108) b!369217))

(assert (= (and b!369213 condMapEmpty!14553) mapIsEmpty!14553))

(assert (= (and b!369213 (not condMapEmpty!14553)) mapNonEmpty!14553))

(get-info :version)

(assert (= (and mapNonEmpty!14553 ((_ is ValueCellFull!3986) mapValue!14553)) b!369214))

(assert (= (and b!369213 ((_ is ValueCellFull!3986) mapDefault!14553)) b!369209))

(assert (= start!36870 b!369213))

(declare-fun m!365903 () Bool)

(assert (=> b!369205 m!365903))

(declare-fun m!365905 () Bool)

(assert (=> b!369216 m!365905))

(declare-fun m!365907 () Bool)

(assert (=> start!36870 m!365907))

(declare-fun m!365909 () Bool)

(assert (=> start!36870 m!365909))

(declare-fun m!365911 () Bool)

(assert (=> start!36870 m!365911))

(declare-fun m!365913 () Bool)

(assert (=> b!369215 m!365913))

(declare-fun m!365915 () Bool)

(assert (=> b!369210 m!365915))

(declare-fun m!365917 () Bool)

(assert (=> mapNonEmpty!14553 m!365917))

(declare-fun m!365919 () Bool)

(assert (=> b!369206 m!365919))

(declare-fun m!365921 () Bool)

(assert (=> b!369217 m!365921))

(declare-fun m!365923 () Bool)

(assert (=> b!369217 m!365923))

(declare-fun m!365925 () Bool)

(assert (=> b!369217 m!365925))

(declare-fun m!365927 () Bool)

(assert (=> b!369211 m!365927))

(declare-fun m!365929 () Bool)

(assert (=> b!369207 m!365929))

(declare-fun m!365931 () Bool)

(assert (=> b!369207 m!365931))

(check-sat (not b!369206) b_and!15267 (not b!369207) (not b!369210) (not b_next!8011) (not start!36870) (not b!369217) (not b!369205) (not b!369216) (not mapNonEmpty!14553) tp_is_empty!8659 (not b!369215))
(check-sat b_and!15267 (not b_next!8011))
