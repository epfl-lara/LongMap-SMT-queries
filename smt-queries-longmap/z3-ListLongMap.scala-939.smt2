; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20732 () Bool)

(assert start!20732)

(declare-fun b_free!5391 () Bool)

(declare-fun b_next!5391 () Bool)

(assert (=> start!20732 (= b_free!5391 (not b_next!5391))))

(declare-fun tp!19205 () Bool)

(declare-fun b_and!12137 () Bool)

(assert (=> start!20732 (= tp!19205 b_and!12137)))

(declare-fun b!207476 () Bool)

(declare-fun res!100732 () Bool)

(declare-fun e!135449 () Bool)

(assert (=> b!207476 (=> (not res!100732) (not e!135449))))

(declare-datatypes ((array!9701 0))(
  ( (array!9702 (arr!4601 (Array (_ BitVec 32) (_ BitVec 64))) (size!4926 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9701)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!207476 (= res!100732 (= (select (arr!4601 _keys!825) i!601) k0!843))))

(declare-fun b!207477 () Bool)

(declare-fun res!100735 () Bool)

(assert (=> b!207477 (=> (not res!100735) (not e!135449))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9701 (_ BitVec 32)) Bool)

(assert (=> b!207477 (= res!100735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8939 () Bool)

(declare-fun mapRes!8939 () Bool)

(declare-fun tp!19204 () Bool)

(declare-fun e!135447 () Bool)

(assert (=> mapNonEmpty!8939 (= mapRes!8939 (and tp!19204 e!135447))))

(declare-datatypes ((V!6643 0))(
  ( (V!6644 (val!2668 Int)) )
))
(declare-datatypes ((ValueCell!2280 0))(
  ( (ValueCellFull!2280 (v!4638 V!6643)) (EmptyCell!2280) )
))
(declare-fun mapRest!8939 () (Array (_ BitVec 32) ValueCell!2280))

(declare-fun mapValue!8939 () ValueCell!2280)

(declare-fun mapKey!8939 () (_ BitVec 32))

(declare-datatypes ((array!9703 0))(
  ( (array!9704 (arr!4602 (Array (_ BitVec 32) ValueCell!2280)) (size!4927 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9703)

(assert (=> mapNonEmpty!8939 (= (arr!4602 _values!649) (store mapRest!8939 mapKey!8939 mapValue!8939))))

(declare-fun b!207478 () Bool)

(assert (=> b!207478 (= e!135449 (not true))))

(declare-datatypes ((tuple2!4050 0))(
  ( (tuple2!4051 (_1!2036 (_ BitVec 64)) (_2!2036 V!6643)) )
))
(declare-datatypes ((List!2941 0))(
  ( (Nil!2938) (Cons!2937 (h!3579 tuple2!4050) (t!7872 List!2941)) )
))
(declare-datatypes ((ListLongMap!2963 0))(
  ( (ListLongMap!2964 (toList!1497 List!2941)) )
))
(declare-fun lt!106305 () ListLongMap!2963)

(declare-fun zeroValue!615 () V!6643)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6643)

(declare-fun getCurrentListMap!1064 (array!9701 array!9703 (_ BitVec 32) (_ BitVec 32) V!6643 V!6643 (_ BitVec 32) Int) ListLongMap!2963)

(assert (=> b!207478 (= lt!106305 (getCurrentListMap!1064 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106311 () ListLongMap!2963)

(declare-fun lt!106310 () array!9703)

(assert (=> b!207478 (= lt!106311 (getCurrentListMap!1064 _keys!825 lt!106310 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106306 () ListLongMap!2963)

(declare-fun lt!106307 () ListLongMap!2963)

(assert (=> b!207478 (and (= lt!106306 lt!106307) (= lt!106307 lt!106306))))

(declare-fun lt!106309 () ListLongMap!2963)

(declare-fun v!520 () V!6643)

(declare-fun +!524 (ListLongMap!2963 tuple2!4050) ListLongMap!2963)

(assert (=> b!207478 (= lt!106307 (+!524 lt!106309 (tuple2!4051 k0!843 v!520)))))

(declare-datatypes ((Unit!6336 0))(
  ( (Unit!6337) )
))
(declare-fun lt!106308 () Unit!6336)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!177 (array!9701 array!9703 (_ BitVec 32) (_ BitVec 32) V!6643 V!6643 (_ BitVec 32) (_ BitVec 64) V!6643 (_ BitVec 32) Int) Unit!6336)

(assert (=> b!207478 (= lt!106308 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!177 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!438 (array!9701 array!9703 (_ BitVec 32) (_ BitVec 32) V!6643 V!6643 (_ BitVec 32) Int) ListLongMap!2963)

(assert (=> b!207478 (= lt!106306 (getCurrentListMapNoExtraKeys!438 _keys!825 lt!106310 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207478 (= lt!106310 (array!9704 (store (arr!4602 _values!649) i!601 (ValueCellFull!2280 v!520)) (size!4927 _values!649)))))

(assert (=> b!207478 (= lt!106309 (getCurrentListMapNoExtraKeys!438 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207479 () Bool)

(declare-fun res!100738 () Bool)

(assert (=> b!207479 (=> (not res!100738) (not e!135449))))

(declare-datatypes ((List!2942 0))(
  ( (Nil!2939) (Cons!2938 (h!3580 (_ BitVec 64)) (t!7873 List!2942)) )
))
(declare-fun arrayNoDuplicates!0 (array!9701 (_ BitVec 32) List!2942) Bool)

(assert (=> b!207479 (= res!100738 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2939))))

(declare-fun b!207480 () Bool)

(declare-fun res!100736 () Bool)

(assert (=> b!207480 (=> (not res!100736) (not e!135449))))

(assert (=> b!207480 (= res!100736 (and (= (size!4927 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4926 _keys!825) (size!4927 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207481 () Bool)

(declare-fun e!135445 () Bool)

(declare-fun tp_is_empty!5247 () Bool)

(assert (=> b!207481 (= e!135445 tp_is_empty!5247)))

(declare-fun b!207482 () Bool)

(declare-fun res!100733 () Bool)

(assert (=> b!207482 (=> (not res!100733) (not e!135449))))

(assert (=> b!207482 (= res!100733 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4926 _keys!825))))))

(declare-fun b!207483 () Bool)

(declare-fun res!100737 () Bool)

(assert (=> b!207483 (=> (not res!100737) (not e!135449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207483 (= res!100737 (validKeyInArray!0 k0!843))))

(declare-fun b!207484 () Bool)

(assert (=> b!207484 (= e!135447 tp_is_empty!5247)))

(declare-fun mapIsEmpty!8939 () Bool)

(assert (=> mapIsEmpty!8939 mapRes!8939))

(declare-fun b!207485 () Bool)

(declare-fun e!135446 () Bool)

(assert (=> b!207485 (= e!135446 (and e!135445 mapRes!8939))))

(declare-fun condMapEmpty!8939 () Bool)

(declare-fun mapDefault!8939 () ValueCell!2280)

(assert (=> b!207485 (= condMapEmpty!8939 (= (arr!4602 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2280)) mapDefault!8939)))))

(declare-fun res!100734 () Bool)

(assert (=> start!20732 (=> (not res!100734) (not e!135449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20732 (= res!100734 (validMask!0 mask!1149))))

(assert (=> start!20732 e!135449))

(declare-fun array_inv!3047 (array!9703) Bool)

(assert (=> start!20732 (and (array_inv!3047 _values!649) e!135446)))

(assert (=> start!20732 true))

(assert (=> start!20732 tp_is_empty!5247))

(declare-fun array_inv!3048 (array!9701) Bool)

(assert (=> start!20732 (array_inv!3048 _keys!825)))

(assert (=> start!20732 tp!19205))

(assert (= (and start!20732 res!100734) b!207480))

(assert (= (and b!207480 res!100736) b!207477))

(assert (= (and b!207477 res!100735) b!207479))

(assert (= (and b!207479 res!100738) b!207482))

(assert (= (and b!207482 res!100733) b!207483))

(assert (= (and b!207483 res!100737) b!207476))

(assert (= (and b!207476 res!100732) b!207478))

(assert (= (and b!207485 condMapEmpty!8939) mapIsEmpty!8939))

(assert (= (and b!207485 (not condMapEmpty!8939)) mapNonEmpty!8939))

(get-info :version)

(assert (= (and mapNonEmpty!8939 ((_ is ValueCellFull!2280) mapValue!8939)) b!207484))

(assert (= (and b!207485 ((_ is ValueCellFull!2280) mapDefault!8939)) b!207481))

(assert (= start!20732 b!207485))

(declare-fun m!235219 () Bool)

(assert (=> b!207476 m!235219))

(declare-fun m!235221 () Bool)

(assert (=> b!207478 m!235221))

(declare-fun m!235223 () Bool)

(assert (=> b!207478 m!235223))

(declare-fun m!235225 () Bool)

(assert (=> b!207478 m!235225))

(declare-fun m!235227 () Bool)

(assert (=> b!207478 m!235227))

(declare-fun m!235229 () Bool)

(assert (=> b!207478 m!235229))

(declare-fun m!235231 () Bool)

(assert (=> b!207478 m!235231))

(declare-fun m!235233 () Bool)

(assert (=> b!207478 m!235233))

(declare-fun m!235235 () Bool)

(assert (=> b!207483 m!235235))

(declare-fun m!235237 () Bool)

(assert (=> mapNonEmpty!8939 m!235237))

(declare-fun m!235239 () Bool)

(assert (=> b!207477 m!235239))

(declare-fun m!235241 () Bool)

(assert (=> b!207479 m!235241))

(declare-fun m!235243 () Bool)

(assert (=> start!20732 m!235243))

(declare-fun m!235245 () Bool)

(assert (=> start!20732 m!235245))

(declare-fun m!235247 () Bool)

(assert (=> start!20732 m!235247))

(check-sat (not mapNonEmpty!8939) (not b!207479) b_and!12137 (not b!207483) tp_is_empty!5247 (not start!20732) (not b_next!5391) (not b!207478) (not b!207477))
(check-sat b_and!12137 (not b_next!5391))
