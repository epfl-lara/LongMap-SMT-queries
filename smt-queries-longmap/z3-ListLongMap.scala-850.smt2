; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20198 () Bool)

(assert start!20198)

(declare-fun b_free!4857 () Bool)

(declare-fun b_next!4857 () Bool)

(assert (=> start!20198 (= b_free!4857 (not b_next!4857))))

(declare-fun tp!17602 () Bool)

(declare-fun b_and!11603 () Bool)

(assert (=> start!20198 (= tp!17602 b_and!11603)))

(declare-fun b!198404 () Bool)

(declare-fun res!94066 () Bool)

(declare-fun e!130409 () Bool)

(assert (=> b!198404 (=> (not res!94066) (not e!130409))))

(declare-datatypes ((array!8675 0))(
  ( (array!8676 (arr!4088 (Array (_ BitVec 32) (_ BitVec 64))) (size!4413 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8675)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8675 (_ BitVec 32)) Bool)

(assert (=> b!198404 (= res!94066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198405 () Bool)

(declare-fun res!94069 () Bool)

(assert (=> b!198405 (=> (not res!94069) (not e!130409))))

(declare-datatypes ((List!2557 0))(
  ( (Nil!2554) (Cons!2553 (h!3195 (_ BitVec 64)) (t!7488 List!2557)) )
))
(declare-fun arrayNoDuplicates!0 (array!8675 (_ BitVec 32) List!2557) Bool)

(assert (=> b!198405 (= res!94069 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2554))))

(declare-fun b!198406 () Bool)

(declare-fun res!94067 () Bool)

(assert (=> b!198406 (=> (not res!94067) (not e!130409))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198406 (= res!94067 (validKeyInArray!0 k0!843))))

(declare-fun b!198407 () Bool)

(declare-fun res!94068 () Bool)

(assert (=> b!198407 (=> (not res!94068) (not e!130409))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5931 0))(
  ( (V!5932 (val!2401 Int)) )
))
(declare-datatypes ((ValueCell!2013 0))(
  ( (ValueCellFull!2013 (v!4371 V!5931)) (EmptyCell!2013) )
))
(declare-datatypes ((array!8677 0))(
  ( (array!8678 (arr!4089 (Array (_ BitVec 32) ValueCell!2013)) (size!4414 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8677)

(assert (=> b!198407 (= res!94068 (and (= (size!4414 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4413 _keys!825) (size!4414 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8138 () Bool)

(declare-fun mapRes!8138 () Bool)

(declare-fun tp!17603 () Bool)

(declare-fun e!130408 () Bool)

(assert (=> mapNonEmpty!8138 (= mapRes!8138 (and tp!17603 e!130408))))

(declare-fun mapValue!8138 () ValueCell!2013)

(declare-fun mapKey!8138 () (_ BitVec 32))

(declare-fun mapRest!8138 () (Array (_ BitVec 32) ValueCell!2013))

(assert (=> mapNonEmpty!8138 (= (arr!4089 _values!649) (store mapRest!8138 mapKey!8138 mapValue!8138))))

(declare-fun b!198408 () Bool)

(assert (=> b!198408 (= e!130409 false)))

(declare-fun v!520 () V!5931)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5931)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5931)

(declare-datatypes ((tuple2!3644 0))(
  ( (tuple2!3645 (_1!1833 (_ BitVec 64)) (_2!1833 V!5931)) )
))
(declare-datatypes ((List!2558 0))(
  ( (Nil!2555) (Cons!2554 (h!3196 tuple2!3644) (t!7489 List!2558)) )
))
(declare-datatypes ((ListLongMap!2557 0))(
  ( (ListLongMap!2558 (toList!1294 List!2558)) )
))
(declare-fun lt!97911 () ListLongMap!2557)

(declare-fun getCurrentListMapNoExtraKeys!259 (array!8675 array!8677 (_ BitVec 32) (_ BitVec 32) V!5931 V!5931 (_ BitVec 32) Int) ListLongMap!2557)

(assert (=> b!198408 (= lt!97911 (getCurrentListMapNoExtraKeys!259 _keys!825 (array!8678 (store (arr!4089 _values!649) i!601 (ValueCellFull!2013 v!520)) (size!4414 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97910 () ListLongMap!2557)

(assert (=> b!198408 (= lt!97910 (getCurrentListMapNoExtraKeys!259 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198409 () Bool)

(declare-fun e!130405 () Bool)

(declare-fun e!130407 () Bool)

(assert (=> b!198409 (= e!130405 (and e!130407 mapRes!8138))))

(declare-fun condMapEmpty!8138 () Bool)

(declare-fun mapDefault!8138 () ValueCell!2013)

(assert (=> b!198409 (= condMapEmpty!8138 (= (arr!4089 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2013)) mapDefault!8138)))))

(declare-fun res!94065 () Bool)

(assert (=> start!20198 (=> (not res!94065) (not e!130409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20198 (= res!94065 (validMask!0 mask!1149))))

(assert (=> start!20198 e!130409))

(declare-fun array_inv!2677 (array!8677) Bool)

(assert (=> start!20198 (and (array_inv!2677 _values!649) e!130405)))

(assert (=> start!20198 true))

(declare-fun tp_is_empty!4713 () Bool)

(assert (=> start!20198 tp_is_empty!4713))

(declare-fun array_inv!2678 (array!8675) Bool)

(assert (=> start!20198 (array_inv!2678 _keys!825)))

(assert (=> start!20198 tp!17602))

(declare-fun b!198410 () Bool)

(declare-fun res!94063 () Bool)

(assert (=> b!198410 (=> (not res!94063) (not e!130409))))

(assert (=> b!198410 (= res!94063 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4413 _keys!825))))))

(declare-fun b!198411 () Bool)

(assert (=> b!198411 (= e!130407 tp_is_empty!4713)))

(declare-fun mapIsEmpty!8138 () Bool)

(assert (=> mapIsEmpty!8138 mapRes!8138))

(declare-fun b!198412 () Bool)

(assert (=> b!198412 (= e!130408 tp_is_empty!4713)))

(declare-fun b!198413 () Bool)

(declare-fun res!94064 () Bool)

(assert (=> b!198413 (=> (not res!94064) (not e!130409))))

(assert (=> b!198413 (= res!94064 (= (select (arr!4088 _keys!825) i!601) k0!843))))

(assert (= (and start!20198 res!94065) b!198407))

(assert (= (and b!198407 res!94068) b!198404))

(assert (= (and b!198404 res!94066) b!198405))

(assert (= (and b!198405 res!94069) b!198410))

(assert (= (and b!198410 res!94063) b!198406))

(assert (= (and b!198406 res!94067) b!198413))

(assert (= (and b!198413 res!94064) b!198408))

(assert (= (and b!198409 condMapEmpty!8138) mapIsEmpty!8138))

(assert (= (and b!198409 (not condMapEmpty!8138)) mapNonEmpty!8138))

(get-info :version)

(assert (= (and mapNonEmpty!8138 ((_ is ValueCellFull!2013) mapValue!8138)) b!198412))

(assert (= (and b!198409 ((_ is ValueCellFull!2013) mapDefault!8138)) b!198411))

(assert (= start!20198 b!198409))

(declare-fun m!225023 () Bool)

(assert (=> b!198406 m!225023))

(declare-fun m!225025 () Bool)

(assert (=> b!198405 m!225025))

(declare-fun m!225027 () Bool)

(assert (=> start!20198 m!225027))

(declare-fun m!225029 () Bool)

(assert (=> start!20198 m!225029))

(declare-fun m!225031 () Bool)

(assert (=> start!20198 m!225031))

(declare-fun m!225033 () Bool)

(assert (=> b!198408 m!225033))

(declare-fun m!225035 () Bool)

(assert (=> b!198408 m!225035))

(declare-fun m!225037 () Bool)

(assert (=> b!198408 m!225037))

(declare-fun m!225039 () Bool)

(assert (=> b!198404 m!225039))

(declare-fun m!225041 () Bool)

(assert (=> mapNonEmpty!8138 m!225041))

(declare-fun m!225043 () Bool)

(assert (=> b!198413 m!225043))

(check-sat (not start!20198) (not b!198408) tp_is_empty!4713 (not b!198406) (not b_next!4857) b_and!11603 (not b!198405) (not mapNonEmpty!8138) (not b!198404))
(check-sat b_and!11603 (not b_next!4857))
