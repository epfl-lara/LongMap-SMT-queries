; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20606 () Bool)

(assert start!20606)

(declare-fun b_free!5265 () Bool)

(declare-fun b_next!5265 () Bool)

(assert (=> start!20606 (= b_free!5265 (not b_next!5265))))

(declare-fun tp!18826 () Bool)

(declare-fun b_and!12011 () Bool)

(assert (=> start!20606 (= tp!18826 b_and!12011)))

(declare-fun b!205416 () Bool)

(declare-fun res!99245 () Bool)

(declare-fun e!134331 () Bool)

(assert (=> b!205416 (=> (not res!99245) (not e!134331))))

(declare-datatypes ((array!9455 0))(
  ( (array!9456 (arr!4478 (Array (_ BitVec 32) (_ BitVec 64))) (size!4803 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9455)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205416 (= res!99245 (= (select (arr!4478 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8750 () Bool)

(declare-fun mapRes!8750 () Bool)

(assert (=> mapIsEmpty!8750 mapRes!8750))

(declare-fun b!205418 () Bool)

(declare-fun e!134333 () Bool)

(declare-fun tp_is_empty!5121 () Bool)

(assert (=> b!205418 (= e!134333 tp_is_empty!5121)))

(declare-fun b!205419 () Bool)

(declare-fun e!134334 () Bool)

(assert (=> b!205419 (= e!134334 (bvsle #b00000000000000000000000000000000 (size!4803 _keys!825)))))

(declare-datatypes ((V!6475 0))(
  ( (V!6476 (val!2605 Int)) )
))
(declare-datatypes ((tuple2!3952 0))(
  ( (tuple2!3953 (_1!1987 (_ BitVec 64)) (_2!1987 V!6475)) )
))
(declare-datatypes ((List!2849 0))(
  ( (Nil!2846) (Cons!2845 (h!3487 tuple2!3952) (t!7780 List!2849)) )
))
(declare-datatypes ((ListLongMap!2865 0))(
  ( (ListLongMap!2866 (toList!1448 List!2849)) )
))
(declare-fun lt!104555 () ListLongMap!2865)

(declare-fun lt!104556 () ListLongMap!2865)

(declare-fun lt!104554 () tuple2!3952)

(declare-fun +!475 (ListLongMap!2865 tuple2!3952) ListLongMap!2865)

(assert (=> b!205419 (= lt!104555 (+!475 lt!104556 lt!104554))))

(declare-datatypes ((Unit!6242 0))(
  ( (Unit!6243) )
))
(declare-fun lt!104553 () Unit!6242)

(declare-fun minValue!615 () V!6475)

(declare-fun lt!104548 () ListLongMap!2865)

(declare-fun v!520 () V!6475)

(declare-fun addCommutativeForDiffKeys!176 (ListLongMap!2865 (_ BitVec 64) V!6475 (_ BitVec 64) V!6475) Unit!6242)

(assert (=> b!205419 (= lt!104553 (addCommutativeForDiffKeys!176 lt!104548 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205420 () Bool)

(declare-fun res!99246 () Bool)

(assert (=> b!205420 (=> (not res!99246) (not e!134331))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9455 (_ BitVec 32)) Bool)

(assert (=> b!205420 (= res!99246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205421 () Bool)

(declare-fun res!99244 () Bool)

(assert (=> b!205421 (=> (not res!99244) (not e!134331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205421 (= res!99244 (validKeyInArray!0 k0!843))))

(declare-fun b!205422 () Bool)

(declare-fun e!134336 () Bool)

(assert (=> b!205422 (= e!134336 tp_is_empty!5121)))

(declare-fun b!205423 () Bool)

(declare-fun e!134330 () Bool)

(assert (=> b!205423 (= e!134330 (and e!134333 mapRes!8750))))

(declare-fun condMapEmpty!8750 () Bool)

(declare-datatypes ((ValueCell!2217 0))(
  ( (ValueCellFull!2217 (v!4575 V!6475)) (EmptyCell!2217) )
))
(declare-datatypes ((array!9457 0))(
  ( (array!9458 (arr!4479 (Array (_ BitVec 32) ValueCell!2217)) (size!4804 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9457)

(declare-fun mapDefault!8750 () ValueCell!2217)

(assert (=> b!205423 (= condMapEmpty!8750 (= (arr!4479 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2217)) mapDefault!8750)))))

(declare-fun b!205424 () Bool)

(declare-fun res!99243 () Bool)

(assert (=> b!205424 (=> (not res!99243) (not e!134331))))

(declare-datatypes ((List!2850 0))(
  ( (Nil!2847) (Cons!2846 (h!3488 (_ BitVec 64)) (t!7781 List!2850)) )
))
(declare-fun arrayNoDuplicates!0 (array!9455 (_ BitVec 32) List!2850) Bool)

(assert (=> b!205424 (= res!99243 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2847))))

(declare-fun b!205425 () Bool)

(declare-fun res!99240 () Bool)

(assert (=> b!205425 (=> (not res!99240) (not e!134331))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205425 (= res!99240 (and (= (size!4804 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4803 _keys!825) (size!4804 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8750 () Bool)

(declare-fun tp!18827 () Bool)

(assert (=> mapNonEmpty!8750 (= mapRes!8750 (and tp!18827 e!134336))))

(declare-fun mapKey!8750 () (_ BitVec 32))

(declare-fun mapValue!8750 () ValueCell!2217)

(declare-fun mapRest!8750 () (Array (_ BitVec 32) ValueCell!2217))

(assert (=> mapNonEmpty!8750 (= (arr!4479 _values!649) (store mapRest!8750 mapKey!8750 mapValue!8750))))

(declare-fun res!99241 () Bool)

(assert (=> start!20606 (=> (not res!99241) (not e!134331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20606 (= res!99241 (validMask!0 mask!1149))))

(assert (=> start!20606 e!134331))

(declare-fun array_inv!2961 (array!9457) Bool)

(assert (=> start!20606 (and (array_inv!2961 _values!649) e!134330)))

(assert (=> start!20606 true))

(assert (=> start!20606 tp_is_empty!5121))

(declare-fun array_inv!2962 (array!9455) Bool)

(assert (=> start!20606 (array_inv!2962 _keys!825)))

(assert (=> start!20606 tp!18826))

(declare-fun b!205417 () Bool)

(declare-fun res!99247 () Bool)

(assert (=> b!205417 (=> (not res!99247) (not e!134331))))

(assert (=> b!205417 (= res!99247 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4803 _keys!825))))))

(declare-fun b!205426 () Bool)

(declare-fun e!134332 () Bool)

(assert (=> b!205426 (= e!134332 e!134334)))

(declare-fun res!99242 () Bool)

(assert (=> b!205426 (=> res!99242 e!134334)))

(assert (=> b!205426 (= res!99242 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104558 () ListLongMap!2865)

(assert (=> b!205426 (= lt!104558 lt!104556)))

(declare-fun lt!104550 () tuple2!3952)

(assert (=> b!205426 (= lt!104556 (+!475 lt!104548 lt!104550))))

(declare-fun lt!104549 () ListLongMap!2865)

(assert (=> b!205426 (= lt!104549 lt!104555)))

(declare-fun lt!104551 () ListLongMap!2865)

(assert (=> b!205426 (= lt!104555 (+!475 lt!104551 lt!104550))))

(declare-fun lt!104557 () ListLongMap!2865)

(assert (=> b!205426 (= lt!104549 (+!475 lt!104557 lt!104550))))

(assert (=> b!205426 (= lt!104550 (tuple2!3953 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205427 () Bool)

(assert (=> b!205427 (= e!134331 (not e!134332))))

(declare-fun res!99239 () Bool)

(assert (=> b!205427 (=> res!99239 e!134332)))

(assert (=> b!205427 (= res!99239 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6475)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1019 (array!9455 array!9457 (_ BitVec 32) (_ BitVec 32) V!6475 V!6475 (_ BitVec 32) Int) ListLongMap!2865)

(assert (=> b!205427 (= lt!104558 (getCurrentListMap!1019 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104559 () array!9457)

(assert (=> b!205427 (= lt!104549 (getCurrentListMap!1019 _keys!825 lt!104559 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205427 (and (= lt!104557 lt!104551) (= lt!104551 lt!104557))))

(assert (=> b!205427 (= lt!104551 (+!475 lt!104548 lt!104554))))

(assert (=> b!205427 (= lt!104554 (tuple2!3953 k0!843 v!520))))

(declare-fun lt!104552 () Unit!6242)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!132 (array!9455 array!9457 (_ BitVec 32) (_ BitVec 32) V!6475 V!6475 (_ BitVec 32) (_ BitVec 64) V!6475 (_ BitVec 32) Int) Unit!6242)

(assert (=> b!205427 (= lt!104552 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!132 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!393 (array!9455 array!9457 (_ BitVec 32) (_ BitVec 32) V!6475 V!6475 (_ BitVec 32) Int) ListLongMap!2865)

(assert (=> b!205427 (= lt!104557 (getCurrentListMapNoExtraKeys!393 _keys!825 lt!104559 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205427 (= lt!104559 (array!9458 (store (arr!4479 _values!649) i!601 (ValueCellFull!2217 v!520)) (size!4804 _values!649)))))

(assert (=> b!205427 (= lt!104548 (getCurrentListMapNoExtraKeys!393 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20606 res!99241) b!205425))

(assert (= (and b!205425 res!99240) b!205420))

(assert (= (and b!205420 res!99246) b!205424))

(assert (= (and b!205424 res!99243) b!205417))

(assert (= (and b!205417 res!99247) b!205421))

(assert (= (and b!205421 res!99244) b!205416))

(assert (= (and b!205416 res!99245) b!205427))

(assert (= (and b!205427 (not res!99239)) b!205426))

(assert (= (and b!205426 (not res!99242)) b!205419))

(assert (= (and b!205423 condMapEmpty!8750) mapIsEmpty!8750))

(assert (= (and b!205423 (not condMapEmpty!8750)) mapNonEmpty!8750))

(get-info :version)

(assert (= (and mapNonEmpty!8750 ((_ is ValueCellFull!2217) mapValue!8750)) b!205422))

(assert (= (and b!205423 ((_ is ValueCellFull!2217) mapDefault!8750)) b!205418))

(assert (= start!20606 b!205423))

(declare-fun m!233039 () Bool)

(assert (=> b!205420 m!233039))

(declare-fun m!233041 () Bool)

(assert (=> b!205427 m!233041))

(declare-fun m!233043 () Bool)

(assert (=> b!205427 m!233043))

(declare-fun m!233045 () Bool)

(assert (=> b!205427 m!233045))

(declare-fun m!233047 () Bool)

(assert (=> b!205427 m!233047))

(declare-fun m!233049 () Bool)

(assert (=> b!205427 m!233049))

(declare-fun m!233051 () Bool)

(assert (=> b!205427 m!233051))

(declare-fun m!233053 () Bool)

(assert (=> b!205427 m!233053))

(declare-fun m!233055 () Bool)

(assert (=> b!205419 m!233055))

(declare-fun m!233057 () Bool)

(assert (=> b!205419 m!233057))

(declare-fun m!233059 () Bool)

(assert (=> b!205426 m!233059))

(declare-fun m!233061 () Bool)

(assert (=> b!205426 m!233061))

(declare-fun m!233063 () Bool)

(assert (=> b!205426 m!233063))

(declare-fun m!233065 () Bool)

(assert (=> start!20606 m!233065))

(declare-fun m!233067 () Bool)

(assert (=> start!20606 m!233067))

(declare-fun m!233069 () Bool)

(assert (=> start!20606 m!233069))

(declare-fun m!233071 () Bool)

(assert (=> mapNonEmpty!8750 m!233071))

(declare-fun m!233073 () Bool)

(assert (=> b!205421 m!233073))

(declare-fun m!233075 () Bool)

(assert (=> b!205424 m!233075))

(declare-fun m!233077 () Bool)

(assert (=> b!205416 m!233077))

(check-sat (not b!205421) b_and!12011 (not b!205426) (not b_next!5265) (not b!205419) tp_is_empty!5121 (not b!205420) (not start!20606) (not mapNonEmpty!8750) (not b!205427) (not b!205424))
(check-sat b_and!12011 (not b_next!5265))
