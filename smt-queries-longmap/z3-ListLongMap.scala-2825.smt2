; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40900 () Bool)

(assert start!40900)

(declare-fun b_free!10849 () Bool)

(declare-fun b_next!10849 () Bool)

(assert (=> start!40900 (= b_free!10849 (not b_next!10849))))

(declare-fun tp!38374 () Bool)

(declare-fun b_and!19001 () Bool)

(assert (=> start!40900 (= tp!38374 b_and!19001)))

(declare-fun b!454666 () Bool)

(declare-fun res!270991 () Bool)

(declare-fun e!265960 () Bool)

(assert (=> b!454666 (=> (not res!270991) (not e!265960))))

(declare-datatypes ((array!28170 0))(
  ( (array!28171 (arr!13528 (Array (_ BitVec 32) (_ BitVec 64))) (size!13880 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28170)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454666 (= res!270991 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454667 () Bool)

(declare-fun res!270993 () Bool)

(assert (=> b!454667 (=> (not res!270993) (not e!265960))))

(declare-datatypes ((List!8060 0))(
  ( (Nil!8057) (Cons!8056 (h!8912 (_ BitVec 64)) (t!13880 List!8060)) )
))
(declare-fun arrayNoDuplicates!0 (array!28170 (_ BitVec 32) List!8060) Bool)

(assert (=> b!454667 (= res!270993 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8057))))

(declare-fun b!454668 () Bool)

(declare-fun e!265958 () Bool)

(assert (=> b!454668 (= e!265960 e!265958)))

(declare-fun res!270997 () Bool)

(assert (=> b!454668 (=> (not res!270997) (not e!265958))))

(declare-fun lt!206207 () array!28170)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28170 (_ BitVec 32)) Bool)

(assert (=> b!454668 (= res!270997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206207 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454668 (= lt!206207 (array!28171 (store (arr!13528 _keys!709) i!563 k0!794) (size!13880 _keys!709)))))

(declare-fun b!454669 () Bool)

(declare-fun res!270999 () Bool)

(assert (=> b!454669 (=> (not res!270999) (not e!265958))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!454669 (= res!270999 (bvsle from!863 i!563))))

(declare-fun b!454670 () Bool)

(declare-fun e!265959 () Bool)

(declare-fun tp_is_empty!12187 () Bool)

(assert (=> b!454670 (= e!265959 tp_is_empty!12187)))

(declare-fun b!454671 () Bool)

(declare-fun res!270998 () Bool)

(assert (=> b!454671 (=> (not res!270998) (not e!265960))))

(assert (=> b!454671 (= res!270998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454672 () Bool)

(declare-fun res!271000 () Bool)

(assert (=> b!454672 (=> (not res!271000) (not e!265958))))

(assert (=> b!454672 (= res!271000 (arrayNoDuplicates!0 lt!206207 #b00000000000000000000000000000000 Nil!8057))))

(declare-fun res!270989 () Bool)

(assert (=> start!40900 (=> (not res!270989) (not e!265960))))

(assert (=> start!40900 (= res!270989 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13880 _keys!709))))))

(assert (=> start!40900 e!265960))

(assert (=> start!40900 tp_is_empty!12187))

(assert (=> start!40900 tp!38374))

(assert (=> start!40900 true))

(declare-datatypes ((V!17355 0))(
  ( (V!17356 (val!6138 Int)) )
))
(declare-datatypes ((ValueCell!5750 0))(
  ( (ValueCellFull!5750 (v!8405 V!17355)) (EmptyCell!5750) )
))
(declare-datatypes ((array!28172 0))(
  ( (array!28173 (arr!13529 (Array (_ BitVec 32) ValueCell!5750)) (size!13881 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28172)

(declare-fun e!265956 () Bool)

(declare-fun array_inv!9876 (array!28172) Bool)

(assert (=> start!40900 (and (array_inv!9876 _values!549) e!265956)))

(declare-fun array_inv!9877 (array!28170) Bool)

(assert (=> start!40900 (array_inv!9877 _keys!709)))

(declare-fun b!454673 () Bool)

(assert (=> b!454673 (= e!265958 false)))

(declare-fun minValue!515 () V!17355)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17355)

(declare-fun v!412 () V!17355)

(declare-datatypes ((tuple2!7992 0))(
  ( (tuple2!7993 (_1!4007 (_ BitVec 64)) (_2!4007 V!17355)) )
))
(declare-datatypes ((List!8061 0))(
  ( (Nil!8058) (Cons!8057 (h!8913 tuple2!7992) (t!13881 List!8061)) )
))
(declare-datatypes ((ListLongMap!6907 0))(
  ( (ListLongMap!6908 (toList!3469 List!8061)) )
))
(declare-fun lt!206206 () ListLongMap!6907)

(declare-fun getCurrentListMapNoExtraKeys!1698 (array!28170 array!28172 (_ BitVec 32) (_ BitVec 32) V!17355 V!17355 (_ BitVec 32) Int) ListLongMap!6907)

(assert (=> b!454673 (= lt!206206 (getCurrentListMapNoExtraKeys!1698 lt!206207 (array!28173 (store (arr!13529 _values!549) i!563 (ValueCellFull!5750 v!412)) (size!13881 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206205 () ListLongMap!6907)

(assert (=> b!454673 (= lt!206205 (getCurrentListMapNoExtraKeys!1698 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454674 () Bool)

(declare-fun res!270990 () Bool)

(assert (=> b!454674 (=> (not res!270990) (not e!265960))))

(assert (=> b!454674 (= res!270990 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13880 _keys!709))))))

(declare-fun b!454675 () Bool)

(declare-fun e!265955 () Bool)

(assert (=> b!454675 (= e!265955 tp_is_empty!12187)))

(declare-fun b!454676 () Bool)

(declare-fun res!270994 () Bool)

(assert (=> b!454676 (=> (not res!270994) (not e!265960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454676 (= res!270994 (validKeyInArray!0 k0!794))))

(declare-fun b!454677 () Bool)

(declare-fun res!270996 () Bool)

(assert (=> b!454677 (=> (not res!270996) (not e!265960))))

(assert (=> b!454677 (= res!270996 (or (= (select (arr!13528 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13528 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454678 () Bool)

(declare-fun res!270995 () Bool)

(assert (=> b!454678 (=> (not res!270995) (not e!265960))))

(assert (=> b!454678 (= res!270995 (and (= (size!13881 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13880 _keys!709) (size!13881 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454679 () Bool)

(declare-fun mapRes!19921 () Bool)

(assert (=> b!454679 (= e!265956 (and e!265959 mapRes!19921))))

(declare-fun condMapEmpty!19921 () Bool)

(declare-fun mapDefault!19921 () ValueCell!5750)

(assert (=> b!454679 (= condMapEmpty!19921 (= (arr!13529 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5750)) mapDefault!19921)))))

(declare-fun mapIsEmpty!19921 () Bool)

(assert (=> mapIsEmpty!19921 mapRes!19921))

(declare-fun b!454680 () Bool)

(declare-fun res!270992 () Bool)

(assert (=> b!454680 (=> (not res!270992) (not e!265960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454680 (= res!270992 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19921 () Bool)

(declare-fun tp!38373 () Bool)

(assert (=> mapNonEmpty!19921 (= mapRes!19921 (and tp!38373 e!265955))))

(declare-fun mapKey!19921 () (_ BitVec 32))

(declare-fun mapValue!19921 () ValueCell!5750)

(declare-fun mapRest!19921 () (Array (_ BitVec 32) ValueCell!5750))

(assert (=> mapNonEmpty!19921 (= (arr!13529 _values!549) (store mapRest!19921 mapKey!19921 mapValue!19921))))

(assert (= (and start!40900 res!270989) b!454680))

(assert (= (and b!454680 res!270992) b!454678))

(assert (= (and b!454678 res!270995) b!454671))

(assert (= (and b!454671 res!270998) b!454667))

(assert (= (and b!454667 res!270993) b!454674))

(assert (= (and b!454674 res!270990) b!454676))

(assert (= (and b!454676 res!270994) b!454677))

(assert (= (and b!454677 res!270996) b!454666))

(assert (= (and b!454666 res!270991) b!454668))

(assert (= (and b!454668 res!270997) b!454672))

(assert (= (and b!454672 res!271000) b!454669))

(assert (= (and b!454669 res!270999) b!454673))

(assert (= (and b!454679 condMapEmpty!19921) mapIsEmpty!19921))

(assert (= (and b!454679 (not condMapEmpty!19921)) mapNonEmpty!19921))

(get-info :version)

(assert (= (and mapNonEmpty!19921 ((_ is ValueCellFull!5750) mapValue!19921)) b!454675))

(assert (= (and b!454679 ((_ is ValueCellFull!5750) mapDefault!19921)) b!454670))

(assert (= start!40900 b!454679))

(declare-fun m!438933 () Bool)

(assert (=> b!454680 m!438933))

(declare-fun m!438935 () Bool)

(assert (=> b!454673 m!438935))

(declare-fun m!438937 () Bool)

(assert (=> b!454673 m!438937))

(declare-fun m!438939 () Bool)

(assert (=> b!454673 m!438939))

(declare-fun m!438941 () Bool)

(assert (=> b!454667 m!438941))

(declare-fun m!438943 () Bool)

(assert (=> b!454677 m!438943))

(declare-fun m!438945 () Bool)

(assert (=> start!40900 m!438945))

(declare-fun m!438947 () Bool)

(assert (=> start!40900 m!438947))

(declare-fun m!438949 () Bool)

(assert (=> b!454676 m!438949))

(declare-fun m!438951 () Bool)

(assert (=> mapNonEmpty!19921 m!438951))

(declare-fun m!438953 () Bool)

(assert (=> b!454666 m!438953))

(declare-fun m!438955 () Bool)

(assert (=> b!454668 m!438955))

(declare-fun m!438957 () Bool)

(assert (=> b!454668 m!438957))

(declare-fun m!438959 () Bool)

(assert (=> b!454672 m!438959))

(declare-fun m!438961 () Bool)

(assert (=> b!454671 m!438961))

(check-sat (not b!454666) tp_is_empty!12187 (not b!454668) (not b_next!10849) (not b!454680) (not start!40900) (not b!454672) (not mapNonEmpty!19921) (not b!454676) b_and!19001 (not b!454673) (not b!454667) (not b!454671))
(check-sat b_and!19001 (not b_next!10849))
