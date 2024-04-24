; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71846 () Bool)

(assert start!71846)

(declare-fun b_free!13513 () Bool)

(declare-fun b_next!13513 () Bool)

(assert (=> start!71846 (= b_free!13513 (not b_next!13513))))

(declare-fun tp!47336 () Bool)

(declare-fun b_and!22609 () Bool)

(assert (=> start!71846 (= tp!47336 b_and!22609)))

(declare-fun b!834479 () Bool)

(declare-fun e!465585 () Bool)

(declare-datatypes ((V!25299 0))(
  ( (V!25300 (val!7659 Int)) )
))
(declare-datatypes ((tuple2!10092 0))(
  ( (tuple2!10093 (_1!5057 (_ BitVec 64)) (_2!5057 V!25299)) )
))
(declare-datatypes ((List!15861 0))(
  ( (Nil!15858) (Cons!15857 (h!16994 tuple2!10092) (t!22224 List!15861)) )
))
(declare-datatypes ((ListLongMap!8917 0))(
  ( (ListLongMap!8918 (toList!4474 List!15861)) )
))
(declare-fun lt!378665 () ListLongMap!8917)

(declare-fun lt!378668 () ListLongMap!8917)

(assert (=> b!834479 (= e!465585 (= lt!378665 lt!378668))))

(declare-fun lt!378667 () ListLongMap!8917)

(assert (=> b!834479 (and (= lt!378668 lt!378667) (= lt!378665 lt!378667))))

(declare-fun lt!378672 () ListLongMap!8917)

(declare-fun lt!378671 () tuple2!10092)

(declare-fun +!1996 (ListLongMap!8917 tuple2!10092) ListLongMap!8917)

(assert (=> b!834479 (= lt!378667 (+!1996 lt!378672 lt!378671))))

(declare-fun lt!378670 () ListLongMap!8917)

(assert (=> b!834479 (= lt!378668 (+!1996 lt!378670 lt!378671))))

(declare-fun zeroValueBefore!34 () V!25299)

(declare-fun zeroValueAfter!34 () V!25299)

(declare-datatypes ((Unit!28578 0))(
  ( (Unit!28579) )
))
(declare-fun lt!378663 () Unit!28578)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!249 (ListLongMap!8917 (_ BitVec 64) V!25299 V!25299) Unit!28578)

(assert (=> b!834479 (= lt!378663 (addSameAsAddTwiceSameKeyDiffValues!249 lt!378670 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!465586 () Bool)

(assert (=> b!834479 e!465586))

(declare-fun res!567161 () Bool)

(assert (=> b!834479 (=> (not res!567161) (not e!465586))))

(declare-fun lt!378664 () ListLongMap!8917)

(assert (=> b!834479 (= res!567161 (= lt!378664 lt!378672))))

(declare-fun lt!378669 () tuple2!10092)

(assert (=> b!834479 (= lt!378672 (+!1996 lt!378670 lt!378669))))

(declare-fun lt!378661 () ListLongMap!8917)

(declare-fun lt!378673 () tuple2!10092)

(assert (=> b!834479 (= lt!378670 (+!1996 lt!378661 lt!378673))))

(assert (=> b!834479 (= lt!378671 (tuple2!10093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!465587 () Bool)

(assert (=> b!834479 e!465587))

(declare-fun res!567165 () Bool)

(assert (=> b!834479 (=> (not res!567165) (not e!465587))))

(assert (=> b!834479 (= res!567165 (= lt!378664 (+!1996 (+!1996 lt!378661 lt!378669) lt!378673)))))

(declare-fun minValue!754 () V!25299)

(assert (=> b!834479 (= lt!378673 (tuple2!10093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!834479 (= lt!378669 (tuple2!10093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46623 0))(
  ( (array!46624 (arr!22341 (Array (_ BitVec 32) (_ BitVec 64))) (size!22761 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46623)

(declare-datatypes ((ValueCell!7196 0))(
  ( (ValueCellFull!7196 (v!10107 V!25299)) (EmptyCell!7196) )
))
(declare-datatypes ((array!46625 0))(
  ( (array!46626 (arr!22342 (Array (_ BitVec 32) ValueCell!7196)) (size!22762 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46625)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2564 (array!46623 array!46625 (_ BitVec 32) (_ BitVec 32) V!25299 V!25299 (_ BitVec 32) Int) ListLongMap!8917)

(assert (=> b!834479 (= lt!378665 (getCurrentListMap!2564 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!834479 (= lt!378664 (getCurrentListMap!2564 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!567160 () Bool)

(declare-fun e!465584 () Bool)

(assert (=> start!71846 (=> (not res!567160) (not e!465584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71846 (= res!567160 (validMask!0 mask!1312))))

(assert (=> start!71846 e!465584))

(declare-fun tp_is_empty!15223 () Bool)

(assert (=> start!71846 tp_is_empty!15223))

(declare-fun array_inv!17833 (array!46623) Bool)

(assert (=> start!71846 (array_inv!17833 _keys!976)))

(assert (=> start!71846 true))

(declare-fun e!465582 () Bool)

(declare-fun array_inv!17834 (array!46625) Bool)

(assert (=> start!71846 (and (array_inv!17834 _values!788) e!465582)))

(assert (=> start!71846 tp!47336))

(declare-fun b!834480 () Bool)

(declare-fun e!465580 () Bool)

(assert (=> b!834480 (= e!465580 tp_is_empty!15223)))

(declare-fun b!834481 () Bool)

(declare-fun e!465581 () Bool)

(declare-fun mapRes!24497 () Bool)

(assert (=> b!834481 (= e!465582 (and e!465581 mapRes!24497))))

(declare-fun condMapEmpty!24497 () Bool)

(declare-fun mapDefault!24497 () ValueCell!7196)

(assert (=> b!834481 (= condMapEmpty!24497 (= (arr!22342 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7196)) mapDefault!24497)))))

(declare-fun mapNonEmpty!24497 () Bool)

(declare-fun tp!47335 () Bool)

(assert (=> mapNonEmpty!24497 (= mapRes!24497 (and tp!47335 e!465580))))

(declare-fun mapRest!24497 () (Array (_ BitVec 32) ValueCell!7196))

(declare-fun mapValue!24497 () ValueCell!7196)

(declare-fun mapKey!24497 () (_ BitVec 32))

(assert (=> mapNonEmpty!24497 (= (arr!22342 _values!788) (store mapRest!24497 mapKey!24497 mapValue!24497))))

(declare-fun mapIsEmpty!24497 () Bool)

(assert (=> mapIsEmpty!24497 mapRes!24497))

(declare-fun b!834482 () Bool)

(assert (=> b!834482 (= e!465581 tp_is_empty!15223)))

(declare-fun b!834483 () Bool)

(assert (=> b!834483 (= e!465584 (not e!465585))))

(declare-fun res!567163 () Bool)

(assert (=> b!834483 (=> res!567163 e!465585)))

(assert (=> b!834483 (= res!567163 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!378666 () ListLongMap!8917)

(assert (=> b!834483 (= lt!378661 lt!378666)))

(declare-fun lt!378662 () Unit!28578)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!610 (array!46623 array!46625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25299 V!25299 V!25299 V!25299 (_ BitVec 32) Int) Unit!28578)

(assert (=> b!834483 (= lt!378662 (lemmaNoChangeToArrayThenSameMapNoExtras!610 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2543 (array!46623 array!46625 (_ BitVec 32) (_ BitVec 32) V!25299 V!25299 (_ BitVec 32) Int) ListLongMap!8917)

(assert (=> b!834483 (= lt!378666 (getCurrentListMapNoExtraKeys!2543 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!834483 (= lt!378661 (getCurrentListMapNoExtraKeys!2543 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!834484 () Bool)

(declare-fun res!567162 () Bool)

(assert (=> b!834484 (=> (not res!567162) (not e!465584))))

(assert (=> b!834484 (= res!567162 (and (= (size!22762 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22761 _keys!976) (size!22762 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!834485 () Bool)

(assert (=> b!834485 (= e!465587 (= lt!378665 (+!1996 (+!1996 lt!378666 (tuple2!10093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378673)))))

(declare-fun b!834486 () Bool)

(assert (=> b!834486 (= e!465586 (= lt!378665 (+!1996 (+!1996 lt!378666 lt!378673) lt!378671)))))

(declare-fun b!834487 () Bool)

(declare-fun res!567164 () Bool)

(assert (=> b!834487 (=> (not res!567164) (not e!465584))))

(declare-datatypes ((List!15862 0))(
  ( (Nil!15859) (Cons!15858 (h!16995 (_ BitVec 64)) (t!22225 List!15862)) )
))
(declare-fun arrayNoDuplicates!0 (array!46623 (_ BitVec 32) List!15862) Bool)

(assert (=> b!834487 (= res!567164 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15859))))

(declare-fun b!834488 () Bool)

(declare-fun res!567159 () Bool)

(assert (=> b!834488 (=> (not res!567159) (not e!465584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46623 (_ BitVec 32)) Bool)

(assert (=> b!834488 (= res!567159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71846 res!567160) b!834484))

(assert (= (and b!834484 res!567162) b!834488))

(assert (= (and b!834488 res!567159) b!834487))

(assert (= (and b!834487 res!567164) b!834483))

(assert (= (and b!834483 (not res!567163)) b!834479))

(assert (= (and b!834479 res!567165) b!834485))

(assert (= (and b!834479 res!567161) b!834486))

(assert (= (and b!834481 condMapEmpty!24497) mapIsEmpty!24497))

(assert (= (and b!834481 (not condMapEmpty!24497)) mapNonEmpty!24497))

(get-info :version)

(assert (= (and mapNonEmpty!24497 ((_ is ValueCellFull!7196) mapValue!24497)) b!834480))

(assert (= (and b!834481 ((_ is ValueCellFull!7196) mapDefault!24497)) b!834482))

(assert (= start!71846 b!834481))

(declare-fun m!779693 () Bool)

(assert (=> mapNonEmpty!24497 m!779693))

(declare-fun m!779695 () Bool)

(assert (=> b!834488 m!779695))

(declare-fun m!779697 () Bool)

(assert (=> b!834487 m!779697))

(declare-fun m!779699 () Bool)

(assert (=> b!834479 m!779699))

(declare-fun m!779701 () Bool)

(assert (=> b!834479 m!779701))

(declare-fun m!779703 () Bool)

(assert (=> b!834479 m!779703))

(declare-fun m!779705 () Bool)

(assert (=> b!834479 m!779705))

(declare-fun m!779707 () Bool)

(assert (=> b!834479 m!779707))

(declare-fun m!779709 () Bool)

(assert (=> b!834479 m!779709))

(assert (=> b!834479 m!779699))

(declare-fun m!779711 () Bool)

(assert (=> b!834479 m!779711))

(declare-fun m!779713 () Bool)

(assert (=> b!834479 m!779713))

(declare-fun m!779715 () Bool)

(assert (=> b!834479 m!779715))

(declare-fun m!779717 () Bool)

(assert (=> b!834483 m!779717))

(declare-fun m!779719 () Bool)

(assert (=> b!834483 m!779719))

(declare-fun m!779721 () Bool)

(assert (=> b!834483 m!779721))

(declare-fun m!779723 () Bool)

(assert (=> b!834486 m!779723))

(assert (=> b!834486 m!779723))

(declare-fun m!779725 () Bool)

(assert (=> b!834486 m!779725))

(declare-fun m!779727 () Bool)

(assert (=> start!71846 m!779727))

(declare-fun m!779729 () Bool)

(assert (=> start!71846 m!779729))

(declare-fun m!779731 () Bool)

(assert (=> start!71846 m!779731))

(declare-fun m!779733 () Bool)

(assert (=> b!834485 m!779733))

(assert (=> b!834485 m!779733))

(declare-fun m!779735 () Bool)

(assert (=> b!834485 m!779735))

(check-sat (not b!834485) (not start!71846) (not mapNonEmpty!24497) b_and!22609 tp_is_empty!15223 (not b!834488) (not b!834483) (not b!834479) (not b!834486) (not b_next!13513) (not b!834487))
(check-sat b_and!22609 (not b_next!13513))
