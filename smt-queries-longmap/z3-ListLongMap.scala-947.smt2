; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20782 () Bool)

(assert start!20782)

(declare-fun b_free!5431 () Bool)

(declare-fun b_next!5431 () Bool)

(assert (=> start!20782 (= b_free!5431 (not b_next!5431))))

(declare-fun tp!19334 () Bool)

(declare-fun b_and!12151 () Bool)

(assert (=> start!20782 (= tp!19334 b_and!12151)))

(declare-fun b!207983 () Bool)

(declare-fun res!101088 () Bool)

(declare-fun e!135690 () Bool)

(assert (=> b!207983 (=> (not res!101088) (not e!135690))))

(declare-datatypes ((array!9777 0))(
  ( (array!9778 (arr!4638 (Array (_ BitVec 32) (_ BitVec 64))) (size!4964 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9777)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9777 (_ BitVec 32)) Bool)

(assert (=> b!207983 (= res!101088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!9008 () Bool)

(declare-fun mapRes!9008 () Bool)

(assert (=> mapIsEmpty!9008 mapRes!9008))

(declare-fun b!207984 () Bool)

(declare-fun res!101090 () Bool)

(assert (=> b!207984 (=> (not res!101090) (not e!135690))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207984 (= res!101090 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4964 _keys!825))))))

(declare-fun b!207985 () Bool)

(declare-fun res!101089 () Bool)

(assert (=> b!207985 (=> (not res!101089) (not e!135690))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6705 0))(
  ( (V!6706 (val!2691 Int)) )
))
(declare-datatypes ((ValueCell!2303 0))(
  ( (ValueCellFull!2303 (v!4655 V!6705)) (EmptyCell!2303) )
))
(declare-datatypes ((array!9779 0))(
  ( (array!9780 (arr!4639 (Array (_ BitVec 32) ValueCell!2303)) (size!4965 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9779)

(assert (=> b!207985 (= res!101089 (and (= (size!4965 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4964 _keys!825) (size!4965 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207986 () Bool)

(declare-fun e!135691 () Bool)

(declare-fun e!135693 () Bool)

(assert (=> b!207986 (= e!135691 (and e!135693 mapRes!9008))))

(declare-fun condMapEmpty!9008 () Bool)

(declare-fun mapDefault!9008 () ValueCell!2303)

(assert (=> b!207986 (= condMapEmpty!9008 (= (arr!4639 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2303)) mapDefault!9008)))))

(declare-fun b!207987 () Bool)

(declare-fun tp_is_empty!5293 () Bool)

(assert (=> b!207987 (= e!135693 tp_is_empty!5293)))

(declare-fun b!207988 () Bool)

(declare-fun res!101085 () Bool)

(assert (=> b!207988 (=> (not res!101085) (not e!135690))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!207988 (= res!101085 (= (select (arr!4638 _keys!825) i!601) k0!843))))

(declare-fun b!207989 () Bool)

(declare-fun e!135692 () Bool)

(assert (=> b!207989 (= e!135692 tp_is_empty!5293)))

(declare-fun b!207990 () Bool)

(declare-fun res!101084 () Bool)

(assert (=> b!207990 (=> (not res!101084) (not e!135690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207990 (= res!101084 (validKeyInArray!0 k0!843))))

(declare-fun b!207991 () Bool)

(declare-fun res!101086 () Bool)

(assert (=> b!207991 (=> (not res!101086) (not e!135690))))

(declare-datatypes ((List!2966 0))(
  ( (Nil!2963) (Cons!2962 (h!3604 (_ BitVec 64)) (t!7888 List!2966)) )
))
(declare-fun arrayNoDuplicates!0 (array!9777 (_ BitVec 32) List!2966) Bool)

(assert (=> b!207991 (= res!101086 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2963))))

(declare-fun res!101087 () Bool)

(assert (=> start!20782 (=> (not res!101087) (not e!135690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20782 (= res!101087 (validMask!0 mask!1149))))

(assert (=> start!20782 e!135690))

(declare-fun array_inv!3047 (array!9779) Bool)

(assert (=> start!20782 (and (array_inv!3047 _values!649) e!135691)))

(assert (=> start!20782 true))

(assert (=> start!20782 tp_is_empty!5293))

(declare-fun array_inv!3048 (array!9777) Bool)

(assert (=> start!20782 (array_inv!3048 _keys!825)))

(assert (=> start!20782 tp!19334))

(declare-fun b!207992 () Bool)

(assert (=> b!207992 (= e!135690 (bvsge i!601 (size!4965 _values!649)))))

(declare-fun zeroValue!615 () V!6705)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6705)

(declare-datatypes ((tuple2!4060 0))(
  ( (tuple2!4061 (_1!2041 (_ BitVec 64)) (_2!2041 V!6705)) )
))
(declare-datatypes ((List!2967 0))(
  ( (Nil!2964) (Cons!2963 (h!3605 tuple2!4060) (t!7889 List!2967)) )
))
(declare-datatypes ((ListLongMap!2963 0))(
  ( (ListLongMap!2964 (toList!1497 List!2967)) )
))
(declare-fun lt!106550 () ListLongMap!2963)

(declare-fun getCurrentListMapNoExtraKeys!448 (array!9777 array!9779 (_ BitVec 32) (_ BitVec 32) V!6705 V!6705 (_ BitVec 32) Int) ListLongMap!2963)

(assert (=> b!207992 (= lt!106550 (getCurrentListMapNoExtraKeys!448 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9008 () Bool)

(declare-fun tp!19333 () Bool)

(assert (=> mapNonEmpty!9008 (= mapRes!9008 (and tp!19333 e!135692))))

(declare-fun mapRest!9008 () (Array (_ BitVec 32) ValueCell!2303))

(declare-fun mapKey!9008 () (_ BitVec 32))

(declare-fun mapValue!9008 () ValueCell!2303)

(assert (=> mapNonEmpty!9008 (= (arr!4639 _values!649) (store mapRest!9008 mapKey!9008 mapValue!9008))))

(assert (= (and start!20782 res!101087) b!207985))

(assert (= (and b!207985 res!101089) b!207983))

(assert (= (and b!207983 res!101088) b!207991))

(assert (= (and b!207991 res!101086) b!207984))

(assert (= (and b!207984 res!101090) b!207990))

(assert (= (and b!207990 res!101084) b!207988))

(assert (= (and b!207988 res!101085) b!207992))

(assert (= (and b!207986 condMapEmpty!9008) mapIsEmpty!9008))

(assert (= (and b!207986 (not condMapEmpty!9008)) mapNonEmpty!9008))

(get-info :version)

(assert (= (and mapNonEmpty!9008 ((_ is ValueCellFull!2303) mapValue!9008)) b!207989))

(assert (= (and b!207986 ((_ is ValueCellFull!2303) mapDefault!9008)) b!207987))

(assert (= start!20782 b!207986))

(declare-fun m!235239 () Bool)

(assert (=> b!207990 m!235239))

(declare-fun m!235241 () Bool)

(assert (=> b!207988 m!235241))

(declare-fun m!235243 () Bool)

(assert (=> b!207991 m!235243))

(declare-fun m!235245 () Bool)

(assert (=> mapNonEmpty!9008 m!235245))

(declare-fun m!235247 () Bool)

(assert (=> b!207983 m!235247))

(declare-fun m!235249 () Bool)

(assert (=> start!20782 m!235249))

(declare-fun m!235251 () Bool)

(assert (=> start!20782 m!235251))

(declare-fun m!235253 () Bool)

(assert (=> start!20782 m!235253))

(declare-fun m!235255 () Bool)

(assert (=> b!207992 m!235255))

(check-sat (not b!207991) (not b!207990) (not b!207983) (not b!207992) tp_is_empty!5293 (not b_next!5431) (not mapNonEmpty!9008) b_and!12151 (not start!20782))
(check-sat b_and!12151 (not b_next!5431))
