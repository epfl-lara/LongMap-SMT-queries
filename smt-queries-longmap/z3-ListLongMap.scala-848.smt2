; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20188 () Bool)

(assert start!20188)

(declare-fun b_free!4843 () Bool)

(declare-fun b_next!4843 () Bool)

(assert (=> start!20188 (= b_free!4843 (not b_next!4843))))

(declare-fun tp!17560 () Bool)

(declare-fun b_and!11603 () Bool)

(assert (=> start!20188 (= tp!17560 b_and!11603)))

(declare-fun b!198242 () Bool)

(declare-fun res!93943 () Bool)

(declare-fun e!130327 () Bool)

(assert (=> b!198242 (=> (not res!93943) (not e!130327))))

(declare-datatypes ((array!8637 0))(
  ( (array!8638 (arr!4069 (Array (_ BitVec 32) (_ BitVec 64))) (size!4394 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8637)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8637 (_ BitVec 32)) Bool)

(assert (=> b!198242 (= res!93943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198243 () Bool)

(declare-fun e!130326 () Bool)

(declare-fun tp_is_empty!4699 () Bool)

(assert (=> b!198243 (= e!130326 tp_is_empty!4699)))

(declare-fun mapNonEmpty!8117 () Bool)

(declare-fun mapRes!8117 () Bool)

(declare-fun tp!17561 () Bool)

(declare-fun e!130325 () Bool)

(assert (=> mapNonEmpty!8117 (= mapRes!8117 (and tp!17561 e!130325))))

(declare-datatypes ((V!5913 0))(
  ( (V!5914 (val!2394 Int)) )
))
(declare-datatypes ((ValueCell!2006 0))(
  ( (ValueCellFull!2006 (v!4365 V!5913)) (EmptyCell!2006) )
))
(declare-fun mapRest!8117 () (Array (_ BitVec 32) ValueCell!2006))

(declare-fun mapValue!8117 () ValueCell!2006)

(declare-datatypes ((array!8639 0))(
  ( (array!8640 (arr!4070 (Array (_ BitVec 32) ValueCell!2006)) (size!4395 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8639)

(declare-fun mapKey!8117 () (_ BitVec 32))

(assert (=> mapNonEmpty!8117 (= (arr!4070 _values!649) (store mapRest!8117 mapKey!8117 mapValue!8117))))

(declare-fun mapIsEmpty!8117 () Bool)

(assert (=> mapIsEmpty!8117 mapRes!8117))

(declare-fun b!198244 () Bool)

(declare-fun res!93942 () Bool)

(assert (=> b!198244 (=> (not res!93942) (not e!130327))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198244 (= res!93942 (validKeyInArray!0 k0!843))))

(declare-fun b!198245 () Bool)

(declare-fun res!93941 () Bool)

(assert (=> b!198245 (=> (not res!93941) (not e!130327))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198245 (= res!93941 (and (= (size!4395 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4394 _keys!825) (size!4395 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198246 () Bool)

(declare-fun res!93938 () Bool)

(assert (=> b!198246 (=> (not res!93938) (not e!130327))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198246 (= res!93938 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4394 _keys!825))))))

(declare-fun res!93939 () Bool)

(assert (=> start!20188 (=> (not res!93939) (not e!130327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20188 (= res!93939 (validMask!0 mask!1149))))

(assert (=> start!20188 e!130327))

(declare-fun e!130328 () Bool)

(declare-fun array_inv!2653 (array!8639) Bool)

(assert (=> start!20188 (and (array_inv!2653 _values!649) e!130328)))

(assert (=> start!20188 true))

(assert (=> start!20188 tp_is_empty!4699))

(declare-fun array_inv!2654 (array!8637) Bool)

(assert (=> start!20188 (array_inv!2654 _keys!825)))

(assert (=> start!20188 tp!17560))

(declare-fun b!198241 () Bool)

(declare-fun res!93937 () Bool)

(assert (=> b!198241 (=> (not res!93937) (not e!130327))))

(declare-datatypes ((List!2497 0))(
  ( (Nil!2494) (Cons!2493 (h!3135 (_ BitVec 64)) (t!7420 List!2497)) )
))
(declare-fun arrayNoDuplicates!0 (array!8637 (_ BitVec 32) List!2497) Bool)

(assert (=> b!198241 (= res!93937 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2494))))

(declare-fun b!198247 () Bool)

(assert (=> b!198247 (= e!130327 false)))

(declare-datatypes ((tuple2!3578 0))(
  ( (tuple2!3579 (_1!1800 (_ BitVec 64)) (_2!1800 V!5913)) )
))
(declare-datatypes ((List!2498 0))(
  ( (Nil!2495) (Cons!2494 (h!3136 tuple2!3578) (t!7421 List!2498)) )
))
(declare-datatypes ((ListLongMap!2493 0))(
  ( (ListLongMap!2494 (toList!1262 List!2498)) )
))
(declare-fun lt!97928 () ListLongMap!2493)

(declare-fun v!520 () V!5913)

(declare-fun zeroValue!615 () V!5913)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5913)

(declare-fun getCurrentListMapNoExtraKeys!252 (array!8637 array!8639 (_ BitVec 32) (_ BitVec 32) V!5913 V!5913 (_ BitVec 32) Int) ListLongMap!2493)

(assert (=> b!198247 (= lt!97928 (getCurrentListMapNoExtraKeys!252 _keys!825 (array!8640 (store (arr!4070 _values!649) i!601 (ValueCellFull!2006 v!520)) (size!4395 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97927 () ListLongMap!2493)

(assert (=> b!198247 (= lt!97927 (getCurrentListMapNoExtraKeys!252 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198248 () Bool)

(declare-fun res!93940 () Bool)

(assert (=> b!198248 (=> (not res!93940) (not e!130327))))

(assert (=> b!198248 (= res!93940 (= (select (arr!4069 _keys!825) i!601) k0!843))))

(declare-fun b!198249 () Bool)

(assert (=> b!198249 (= e!130325 tp_is_empty!4699)))

(declare-fun b!198250 () Bool)

(assert (=> b!198250 (= e!130328 (and e!130326 mapRes!8117))))

(declare-fun condMapEmpty!8117 () Bool)

(declare-fun mapDefault!8117 () ValueCell!2006)

(assert (=> b!198250 (= condMapEmpty!8117 (= (arr!4070 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2006)) mapDefault!8117)))))

(assert (= (and start!20188 res!93939) b!198245))

(assert (= (and b!198245 res!93941) b!198242))

(assert (= (and b!198242 res!93943) b!198241))

(assert (= (and b!198241 res!93937) b!198246))

(assert (= (and b!198246 res!93938) b!198244))

(assert (= (and b!198244 res!93942) b!198248))

(assert (= (and b!198248 res!93940) b!198247))

(assert (= (and b!198250 condMapEmpty!8117) mapIsEmpty!8117))

(assert (= (and b!198250 (not condMapEmpty!8117)) mapNonEmpty!8117))

(get-info :version)

(assert (= (and mapNonEmpty!8117 ((_ is ValueCellFull!2006) mapValue!8117)) b!198249))

(assert (= (and b!198250 ((_ is ValueCellFull!2006) mapDefault!8117)) b!198243))

(assert (= start!20188 b!198250))

(declare-fun m!225051 () Bool)

(assert (=> start!20188 m!225051))

(declare-fun m!225053 () Bool)

(assert (=> start!20188 m!225053))

(declare-fun m!225055 () Bool)

(assert (=> start!20188 m!225055))

(declare-fun m!225057 () Bool)

(assert (=> b!198244 m!225057))

(declare-fun m!225059 () Bool)

(assert (=> b!198247 m!225059))

(declare-fun m!225061 () Bool)

(assert (=> b!198247 m!225061))

(declare-fun m!225063 () Bool)

(assert (=> b!198247 m!225063))

(declare-fun m!225065 () Bool)

(assert (=> b!198248 m!225065))

(declare-fun m!225067 () Bool)

(assert (=> b!198242 m!225067))

(declare-fun m!225069 () Bool)

(assert (=> b!198241 m!225069))

(declare-fun m!225071 () Bool)

(assert (=> mapNonEmpty!8117 m!225071))

(check-sat (not b_next!4843) (not b!198242) (not mapNonEmpty!8117) (not start!20188) b_and!11603 (not b!198247) (not b!198241) (not b!198244) tp_is_empty!4699)
(check-sat b_and!11603 (not b_next!4843))
