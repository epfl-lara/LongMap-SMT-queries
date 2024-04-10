; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40964 () Bool)

(assert start!40964)

(declare-fun b_free!10899 () Bool)

(declare-fun b_next!10899 () Bool)

(assert (=> start!40964 (= b_free!10899 (not b_next!10899))))

(declare-fun tp!38524 () Bool)

(declare-fun b_and!19041 () Bool)

(assert (=> start!40964 (= tp!38524 b_and!19041)))

(declare-fun b!455852 () Bool)

(declare-fun e!266449 () Bool)

(declare-fun tp_is_empty!12237 () Bool)

(assert (=> b!455852 (= e!266449 tp_is_empty!12237)))

(declare-fun mapIsEmpty!19996 () Bool)

(declare-fun mapRes!19996 () Bool)

(assert (=> mapIsEmpty!19996 mapRes!19996))

(declare-fun b!455853 () Bool)

(declare-fun res!271905 () Bool)

(declare-fun e!266447 () Bool)

(assert (=> b!455853 (=> (not res!271905) (not e!266447))))

(declare-datatypes ((array!28277 0))(
  ( (array!28278 (arr!13582 (Array (_ BitVec 32) (_ BitVec 64))) (size!13934 (_ BitVec 32))) )
))
(declare-fun lt!206419 () array!28277)

(declare-datatypes ((List!8189 0))(
  ( (Nil!8186) (Cons!8185 (h!9041 (_ BitVec 64)) (t!14017 List!8189)) )
))
(declare-fun arrayNoDuplicates!0 (array!28277 (_ BitVec 32) List!8189) Bool)

(assert (=> b!455853 (= res!271905 (arrayNoDuplicates!0 lt!206419 #b00000000000000000000000000000000 Nil!8186))))

(declare-fun b!455854 () Bool)

(declare-fun res!271904 () Bool)

(declare-fun e!266444 () Bool)

(assert (=> b!455854 (=> (not res!271904) (not e!266444))))

(declare-fun _keys!709 () array!28277)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28277 (_ BitVec 32)) Bool)

(assert (=> b!455854 (= res!271904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455855 () Bool)

(declare-fun res!271900 () Bool)

(assert (=> b!455855 (=> (not res!271900) (not e!266444))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17421 0))(
  ( (V!17422 (val!6163 Int)) )
))
(declare-datatypes ((ValueCell!5775 0))(
  ( (ValueCellFull!5775 (v!8429 V!17421)) (EmptyCell!5775) )
))
(declare-datatypes ((array!28279 0))(
  ( (array!28280 (arr!13583 (Array (_ BitVec 32) ValueCell!5775)) (size!13935 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28279)

(assert (=> b!455855 (= res!271900 (and (= (size!13935 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13934 _keys!709) (size!13935 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455856 () Bool)

(declare-fun res!271902 () Bool)

(assert (=> b!455856 (=> (not res!271902) (not e!266444))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455856 (= res!271902 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455857 () Bool)

(declare-fun e!266445 () Bool)

(assert (=> b!455857 (= e!266445 tp_is_empty!12237)))

(declare-fun b!455858 () Bool)

(declare-fun res!271906 () Bool)

(assert (=> b!455858 (=> (not res!271906) (not e!266447))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455858 (= res!271906 (bvsle from!863 i!563))))

(declare-fun b!455859 () Bool)

(declare-fun res!271897 () Bool)

(assert (=> b!455859 (=> (not res!271897) (not e!266444))))

(assert (=> b!455859 (= res!271897 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13934 _keys!709))))))

(declare-fun b!455860 () Bool)

(declare-fun res!271901 () Bool)

(assert (=> b!455860 (=> (not res!271901) (not e!266444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455860 (= res!271901 (validMask!0 mask!1025))))

(declare-fun b!455861 () Bool)

(assert (=> b!455861 (= e!266447 false)))

(declare-fun minValue!515 () V!17421)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17421)

(declare-datatypes ((tuple2!8120 0))(
  ( (tuple2!8121 (_1!4071 (_ BitVec 64)) (_2!4071 V!17421)) )
))
(declare-datatypes ((List!8190 0))(
  ( (Nil!8187) (Cons!8186 (h!9042 tuple2!8120) (t!14018 List!8190)) )
))
(declare-datatypes ((ListLongMap!7033 0))(
  ( (ListLongMap!7034 (toList!3532 List!8190)) )
))
(declare-fun lt!206418 () ListLongMap!7033)

(declare-fun v!412 () V!17421)

(declare-fun getCurrentListMapNoExtraKeys!1715 (array!28277 array!28279 (_ BitVec 32) (_ BitVec 32) V!17421 V!17421 (_ BitVec 32) Int) ListLongMap!7033)

(assert (=> b!455861 (= lt!206418 (getCurrentListMapNoExtraKeys!1715 lt!206419 (array!28280 (store (arr!13583 _values!549) i!563 (ValueCellFull!5775 v!412)) (size!13935 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206420 () ListLongMap!7033)

(assert (=> b!455861 (= lt!206420 (getCurrentListMapNoExtraKeys!1715 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455862 () Bool)

(declare-fun e!266446 () Bool)

(assert (=> b!455862 (= e!266446 (and e!266445 mapRes!19996))))

(declare-fun condMapEmpty!19996 () Bool)

(declare-fun mapDefault!19996 () ValueCell!5775)

(assert (=> b!455862 (= condMapEmpty!19996 (= (arr!13583 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5775)) mapDefault!19996)))))

(declare-fun b!455863 () Bool)

(declare-fun res!271903 () Bool)

(assert (=> b!455863 (=> (not res!271903) (not e!266444))))

(assert (=> b!455863 (= res!271903 (or (= (select (arr!13582 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13582 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455864 () Bool)

(assert (=> b!455864 (= e!266444 e!266447)))

(declare-fun res!271899 () Bool)

(assert (=> b!455864 (=> (not res!271899) (not e!266447))))

(assert (=> b!455864 (= res!271899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206419 mask!1025))))

(assert (=> b!455864 (= lt!206419 (array!28278 (store (arr!13582 _keys!709) i!563 k0!794) (size!13934 _keys!709)))))

(declare-fun b!455865 () Bool)

(declare-fun res!271896 () Bool)

(assert (=> b!455865 (=> (not res!271896) (not e!266444))))

(assert (=> b!455865 (= res!271896 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8186))))

(declare-fun b!455866 () Bool)

(declare-fun res!271907 () Bool)

(assert (=> b!455866 (=> (not res!271907) (not e!266444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455866 (= res!271907 (validKeyInArray!0 k0!794))))

(declare-fun res!271898 () Bool)

(assert (=> start!40964 (=> (not res!271898) (not e!266444))))

(assert (=> start!40964 (= res!271898 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13934 _keys!709))))))

(assert (=> start!40964 e!266444))

(assert (=> start!40964 tp_is_empty!12237))

(assert (=> start!40964 tp!38524))

(assert (=> start!40964 true))

(declare-fun array_inv!9844 (array!28279) Bool)

(assert (=> start!40964 (and (array_inv!9844 _values!549) e!266446)))

(declare-fun array_inv!9845 (array!28277) Bool)

(assert (=> start!40964 (array_inv!9845 _keys!709)))

(declare-fun mapNonEmpty!19996 () Bool)

(declare-fun tp!38523 () Bool)

(assert (=> mapNonEmpty!19996 (= mapRes!19996 (and tp!38523 e!266449))))

(declare-fun mapKey!19996 () (_ BitVec 32))

(declare-fun mapRest!19996 () (Array (_ BitVec 32) ValueCell!5775))

(declare-fun mapValue!19996 () ValueCell!5775)

(assert (=> mapNonEmpty!19996 (= (arr!13583 _values!549) (store mapRest!19996 mapKey!19996 mapValue!19996))))

(assert (= (and start!40964 res!271898) b!455860))

(assert (= (and b!455860 res!271901) b!455855))

(assert (= (and b!455855 res!271900) b!455854))

(assert (= (and b!455854 res!271904) b!455865))

(assert (= (and b!455865 res!271896) b!455859))

(assert (= (and b!455859 res!271897) b!455866))

(assert (= (and b!455866 res!271907) b!455863))

(assert (= (and b!455863 res!271903) b!455856))

(assert (= (and b!455856 res!271902) b!455864))

(assert (= (and b!455864 res!271899) b!455853))

(assert (= (and b!455853 res!271905) b!455858))

(assert (= (and b!455858 res!271906) b!455861))

(assert (= (and b!455862 condMapEmpty!19996) mapIsEmpty!19996))

(assert (= (and b!455862 (not condMapEmpty!19996)) mapNonEmpty!19996))

(get-info :version)

(assert (= (and mapNonEmpty!19996 ((_ is ValueCellFull!5775) mapValue!19996)) b!455852))

(assert (= (and b!455862 ((_ is ValueCellFull!5775) mapDefault!19996)) b!455857))

(assert (= start!40964 b!455862))

(declare-fun m!439501 () Bool)

(assert (=> mapNonEmpty!19996 m!439501))

(declare-fun m!439503 () Bool)

(assert (=> b!455861 m!439503))

(declare-fun m!439505 () Bool)

(assert (=> b!455861 m!439505))

(declare-fun m!439507 () Bool)

(assert (=> b!455861 m!439507))

(declare-fun m!439509 () Bool)

(assert (=> start!40964 m!439509))

(declare-fun m!439511 () Bool)

(assert (=> start!40964 m!439511))

(declare-fun m!439513 () Bool)

(assert (=> b!455853 m!439513))

(declare-fun m!439515 () Bool)

(assert (=> b!455854 m!439515))

(declare-fun m!439517 () Bool)

(assert (=> b!455866 m!439517))

(declare-fun m!439519 () Bool)

(assert (=> b!455865 m!439519))

(declare-fun m!439521 () Bool)

(assert (=> b!455864 m!439521))

(declare-fun m!439523 () Bool)

(assert (=> b!455864 m!439523))

(declare-fun m!439525 () Bool)

(assert (=> b!455856 m!439525))

(declare-fun m!439527 () Bool)

(assert (=> b!455863 m!439527))

(declare-fun m!439529 () Bool)

(assert (=> b!455860 m!439529))

(check-sat b_and!19041 (not b!455853) (not b!455854) (not mapNonEmpty!19996) (not b!455866) (not b!455865) (not b!455856) (not start!40964) (not b_next!10899) (not b!455864) (not b!455861) tp_is_empty!12237 (not b!455860))
(check-sat b_and!19041 (not b_next!10899))
