; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20126 () Bool)

(assert start!20126)

(declare-fun b_free!4785 () Bool)

(declare-fun b_next!4785 () Bool)

(assert (=> start!20126 (= b_free!4785 (not b_next!4785))))

(declare-fun tp!17387 () Bool)

(declare-fun b_and!11531 () Bool)

(assert (=> start!20126 (= tp!17387 b_and!11531)))

(declare-fun mapIsEmpty!8030 () Bool)

(declare-fun mapRes!8030 () Bool)

(assert (=> mapIsEmpty!8030 mapRes!8030))

(declare-fun b!197324 () Bool)

(declare-fun res!93312 () Bool)

(declare-fun e!129868 () Bool)

(assert (=> b!197324 (=> (not res!93312) (not e!129868))))

(declare-datatypes ((array!8535 0))(
  ( (array!8536 (arr!4018 (Array (_ BitVec 32) (_ BitVec 64))) (size!4343 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8535)

(declare-datatypes ((List!2507 0))(
  ( (Nil!2504) (Cons!2503 (h!3145 (_ BitVec 64)) (t!7438 List!2507)) )
))
(declare-fun arrayNoDuplicates!0 (array!8535 (_ BitVec 32) List!2507) Bool)

(assert (=> b!197324 (= res!93312 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2504))))

(declare-fun b!197325 () Bool)

(declare-fun res!93308 () Bool)

(assert (=> b!197325 (=> (not res!93308) (not e!129868))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197325 (= res!93308 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4343 _keys!825))))))

(declare-fun b!197326 () Bool)

(assert (=> b!197326 (= e!129868 false)))

(declare-datatypes ((V!5835 0))(
  ( (V!5836 (val!2365 Int)) )
))
(declare-datatypes ((tuple2!3596 0))(
  ( (tuple2!3597 (_1!1809 (_ BitVec 64)) (_2!1809 V!5835)) )
))
(declare-datatypes ((List!2508 0))(
  ( (Nil!2505) (Cons!2504 (h!3146 tuple2!3596) (t!7439 List!2508)) )
))
(declare-datatypes ((ListLongMap!2509 0))(
  ( (ListLongMap!2510 (toList!1270 List!2508)) )
))
(declare-fun lt!97707 () ListLongMap!2509)

(declare-datatypes ((ValueCell!1977 0))(
  ( (ValueCellFull!1977 (v!4335 V!5835)) (EmptyCell!1977) )
))
(declare-datatypes ((array!8537 0))(
  ( (array!8538 (arr!4019 (Array (_ BitVec 32) ValueCell!1977)) (size!4344 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8537)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5835)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5835)

(declare-fun getCurrentListMapNoExtraKeys!235 (array!8535 array!8537 (_ BitVec 32) (_ BitVec 32) V!5835 V!5835 (_ BitVec 32) Int) ListLongMap!2509)

(assert (=> b!197326 (= lt!97707 (getCurrentListMapNoExtraKeys!235 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197327 () Bool)

(declare-fun res!93310 () Bool)

(assert (=> b!197327 (=> (not res!93310) (not e!129868))))

(assert (=> b!197327 (= res!93310 (and (= (size!4344 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4343 _keys!825) (size!4344 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197328 () Bool)

(declare-fun res!93313 () Bool)

(assert (=> b!197328 (=> (not res!93313) (not e!129868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8535 (_ BitVec 32)) Bool)

(assert (=> b!197328 (= res!93313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!93307 () Bool)

(assert (=> start!20126 (=> (not res!93307) (not e!129868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20126 (= res!93307 (validMask!0 mask!1149))))

(assert (=> start!20126 e!129868))

(declare-fun e!129865 () Bool)

(declare-fun array_inv!2621 (array!8537) Bool)

(assert (=> start!20126 (and (array_inv!2621 _values!649) e!129865)))

(assert (=> start!20126 true))

(declare-fun tp_is_empty!4641 () Bool)

(assert (=> start!20126 tp_is_empty!4641))

(declare-fun array_inv!2622 (array!8535) Bool)

(assert (=> start!20126 (array_inv!2622 _keys!825)))

(assert (=> start!20126 tp!17387))

(declare-fun b!197329 () Bool)

(declare-fun e!129869 () Bool)

(assert (=> b!197329 (= e!129869 tp_is_empty!4641)))

(declare-fun b!197330 () Bool)

(declare-fun res!93309 () Bool)

(assert (=> b!197330 (=> (not res!93309) (not e!129868))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!197330 (= res!93309 (= (select (arr!4018 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8030 () Bool)

(declare-fun tp!17386 () Bool)

(declare-fun e!129866 () Bool)

(assert (=> mapNonEmpty!8030 (= mapRes!8030 (and tp!17386 e!129866))))

(declare-fun mapValue!8030 () ValueCell!1977)

(declare-fun mapRest!8030 () (Array (_ BitVec 32) ValueCell!1977))

(declare-fun mapKey!8030 () (_ BitVec 32))

(assert (=> mapNonEmpty!8030 (= (arr!4019 _values!649) (store mapRest!8030 mapKey!8030 mapValue!8030))))

(declare-fun b!197331 () Bool)

(assert (=> b!197331 (= e!129866 tp_is_empty!4641)))

(declare-fun b!197332 () Bool)

(declare-fun res!93311 () Bool)

(assert (=> b!197332 (=> (not res!93311) (not e!129868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197332 (= res!93311 (validKeyInArray!0 k0!843))))

(declare-fun b!197333 () Bool)

(assert (=> b!197333 (= e!129865 (and e!129869 mapRes!8030))))

(declare-fun condMapEmpty!8030 () Bool)

(declare-fun mapDefault!8030 () ValueCell!1977)

(assert (=> b!197333 (= condMapEmpty!8030 (= (arr!4019 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1977)) mapDefault!8030)))))

(assert (= (and start!20126 res!93307) b!197327))

(assert (= (and b!197327 res!93310) b!197328))

(assert (= (and b!197328 res!93313) b!197324))

(assert (= (and b!197324 res!93312) b!197325))

(assert (= (and b!197325 res!93308) b!197332))

(assert (= (and b!197332 res!93311) b!197330))

(assert (= (and b!197330 res!93309) b!197326))

(assert (= (and b!197333 condMapEmpty!8030) mapIsEmpty!8030))

(assert (= (and b!197333 (not condMapEmpty!8030)) mapNonEmpty!8030))

(get-info :version)

(assert (= (and mapNonEmpty!8030 ((_ is ValueCellFull!1977) mapValue!8030)) b!197331))

(assert (= (and b!197333 ((_ is ValueCellFull!1977) mapDefault!8030)) b!197329))

(assert (= start!20126 b!197333))

(declare-fun m!224251 () Bool)

(assert (=> b!197326 m!224251))

(declare-fun m!224253 () Bool)

(assert (=> start!20126 m!224253))

(declare-fun m!224255 () Bool)

(assert (=> start!20126 m!224255))

(declare-fun m!224257 () Bool)

(assert (=> start!20126 m!224257))

(declare-fun m!224259 () Bool)

(assert (=> b!197332 m!224259))

(declare-fun m!224261 () Bool)

(assert (=> b!197328 m!224261))

(declare-fun m!224263 () Bool)

(assert (=> b!197324 m!224263))

(declare-fun m!224265 () Bool)

(assert (=> b!197330 m!224265))

(declare-fun m!224267 () Bool)

(assert (=> mapNonEmpty!8030 m!224267))

(check-sat b_and!11531 (not b!197332) (not start!20126) (not mapNonEmpty!8030) (not b!197328) (not b_next!4785) tp_is_empty!4641 (not b!197324) (not b!197326))
(check-sat b_and!11531 (not b_next!4785))
