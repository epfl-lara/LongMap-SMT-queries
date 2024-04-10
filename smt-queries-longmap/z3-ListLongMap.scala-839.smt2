; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20132 () Bool)

(assert start!20132)

(declare-fun b_free!4791 () Bool)

(declare-fun b_next!4791 () Bool)

(assert (=> start!20132 (= b_free!4791 (not b_next!4791))))

(declare-fun tp!17405 () Bool)

(declare-fun b_and!11537 () Bool)

(assert (=> start!20132 (= tp!17405 b_and!11537)))

(declare-fun mapIsEmpty!8039 () Bool)

(declare-fun mapRes!8039 () Bool)

(assert (=> mapIsEmpty!8039 mapRes!8039))

(declare-fun b!197414 () Bool)

(declare-fun e!129913 () Bool)

(declare-fun tp_is_empty!4647 () Bool)

(assert (=> b!197414 (= e!129913 tp_is_empty!4647)))

(declare-fun res!93374 () Bool)

(declare-fun e!129914 () Bool)

(assert (=> start!20132 (=> (not res!93374) (not e!129914))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20132 (= res!93374 (validMask!0 mask!1149))))

(assert (=> start!20132 e!129914))

(declare-datatypes ((V!5843 0))(
  ( (V!5844 (val!2368 Int)) )
))
(declare-datatypes ((ValueCell!1980 0))(
  ( (ValueCellFull!1980 (v!4338 V!5843)) (EmptyCell!1980) )
))
(declare-datatypes ((array!8547 0))(
  ( (array!8548 (arr!4024 (Array (_ BitVec 32) ValueCell!1980)) (size!4349 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8547)

(declare-fun e!129911 () Bool)

(declare-fun array_inv!2625 (array!8547) Bool)

(assert (=> start!20132 (and (array_inv!2625 _values!649) e!129911)))

(assert (=> start!20132 true))

(assert (=> start!20132 tp_is_empty!4647))

(declare-datatypes ((array!8549 0))(
  ( (array!8550 (arr!4025 (Array (_ BitVec 32) (_ BitVec 64))) (size!4350 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8549)

(declare-fun array_inv!2626 (array!8549) Bool)

(assert (=> start!20132 (array_inv!2626 _keys!825)))

(assert (=> start!20132 tp!17405))

(declare-fun b!197415 () Bool)

(declare-fun res!93370 () Bool)

(assert (=> b!197415 (=> (not res!93370) (not e!129914))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197415 (= res!93370 (= (select (arr!4025 _keys!825) i!601) k0!843))))

(declare-fun b!197416 () Bool)

(declare-fun res!93376 () Bool)

(assert (=> b!197416 (=> (not res!93376) (not e!129914))))

(declare-datatypes ((List!2512 0))(
  ( (Nil!2509) (Cons!2508 (h!3150 (_ BitVec 64)) (t!7443 List!2512)) )
))
(declare-fun arrayNoDuplicates!0 (array!8549 (_ BitVec 32) List!2512) Bool)

(assert (=> b!197416 (= res!93376 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2509))))

(declare-fun b!197417 () Bool)

(declare-fun res!93375 () Bool)

(assert (=> b!197417 (=> (not res!93375) (not e!129914))))

(assert (=> b!197417 (= res!93375 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4350 _keys!825))))))

(declare-fun b!197418 () Bool)

(declare-fun e!129912 () Bool)

(assert (=> b!197418 (= e!129912 tp_is_empty!4647)))

(declare-fun b!197419 () Bool)

(assert (=> b!197419 (= e!129914 (bvsgt #b00000000000000000000000000000000 (size!4350 _keys!825)))))

(declare-datatypes ((tuple2!3600 0))(
  ( (tuple2!3601 (_1!1811 (_ BitVec 64)) (_2!1811 V!5843)) )
))
(declare-datatypes ((List!2513 0))(
  ( (Nil!2510) (Cons!2509 (h!3151 tuple2!3600) (t!7444 List!2513)) )
))
(declare-datatypes ((ListLongMap!2513 0))(
  ( (ListLongMap!2514 (toList!1272 List!2513)) )
))
(declare-fun lt!97716 () ListLongMap!2513)

(declare-fun zeroValue!615 () V!5843)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5843)

(declare-fun getCurrentListMapNoExtraKeys!237 (array!8549 array!8547 (_ BitVec 32) (_ BitVec 32) V!5843 V!5843 (_ BitVec 32) Int) ListLongMap!2513)

(assert (=> b!197419 (= lt!97716 (getCurrentListMapNoExtraKeys!237 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197420 () Bool)

(declare-fun res!93371 () Bool)

(assert (=> b!197420 (=> (not res!93371) (not e!129914))))

(assert (=> b!197420 (= res!93371 (and (= (size!4349 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4350 _keys!825) (size!4349 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8039 () Bool)

(declare-fun tp!17404 () Bool)

(assert (=> mapNonEmpty!8039 (= mapRes!8039 (and tp!17404 e!129913))))

(declare-fun mapRest!8039 () (Array (_ BitVec 32) ValueCell!1980))

(declare-fun mapValue!8039 () ValueCell!1980)

(declare-fun mapKey!8039 () (_ BitVec 32))

(assert (=> mapNonEmpty!8039 (= (arr!4024 _values!649) (store mapRest!8039 mapKey!8039 mapValue!8039))))

(declare-fun b!197421 () Bool)

(declare-fun res!93372 () Bool)

(assert (=> b!197421 (=> (not res!93372) (not e!129914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197421 (= res!93372 (validKeyInArray!0 k0!843))))

(declare-fun b!197422 () Bool)

(assert (=> b!197422 (= e!129911 (and e!129912 mapRes!8039))))

(declare-fun condMapEmpty!8039 () Bool)

(declare-fun mapDefault!8039 () ValueCell!1980)

(assert (=> b!197422 (= condMapEmpty!8039 (= (arr!4024 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1980)) mapDefault!8039)))))

(declare-fun b!197423 () Bool)

(declare-fun res!93373 () Bool)

(assert (=> b!197423 (=> (not res!93373) (not e!129914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8549 (_ BitVec 32)) Bool)

(assert (=> b!197423 (= res!93373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20132 res!93374) b!197420))

(assert (= (and b!197420 res!93371) b!197423))

(assert (= (and b!197423 res!93373) b!197416))

(assert (= (and b!197416 res!93376) b!197417))

(assert (= (and b!197417 res!93375) b!197421))

(assert (= (and b!197421 res!93372) b!197415))

(assert (= (and b!197415 res!93370) b!197419))

(assert (= (and b!197422 condMapEmpty!8039) mapIsEmpty!8039))

(assert (= (and b!197422 (not condMapEmpty!8039)) mapNonEmpty!8039))

(get-info :version)

(assert (= (and mapNonEmpty!8039 ((_ is ValueCellFull!1980) mapValue!8039)) b!197414))

(assert (= (and b!197422 ((_ is ValueCellFull!1980) mapDefault!8039)) b!197418))

(assert (= start!20132 b!197422))

(declare-fun m!224305 () Bool)

(assert (=> b!197423 m!224305))

(declare-fun m!224307 () Bool)

(assert (=> b!197421 m!224307))

(declare-fun m!224309 () Bool)

(assert (=> start!20132 m!224309))

(declare-fun m!224311 () Bool)

(assert (=> start!20132 m!224311))

(declare-fun m!224313 () Bool)

(assert (=> start!20132 m!224313))

(declare-fun m!224315 () Bool)

(assert (=> b!197416 m!224315))

(declare-fun m!224317 () Bool)

(assert (=> b!197419 m!224317))

(declare-fun m!224319 () Bool)

(assert (=> mapNonEmpty!8039 m!224319))

(declare-fun m!224321 () Bool)

(assert (=> b!197415 m!224321))

(check-sat (not mapNonEmpty!8039) (not b!197421) tp_is_empty!4647 (not b!197423) (not b!197419) (not b!197416) (not b_next!4791) (not start!20132) b_and!11537)
(check-sat b_and!11537 (not b_next!4791))
