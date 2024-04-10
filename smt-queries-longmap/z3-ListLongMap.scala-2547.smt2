; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39102 () Bool)

(assert start!39102)

(declare-fun b_free!9369 () Bool)

(declare-fun b_next!9369 () Bool)

(assert (=> start!39102 (= b_free!9369 (not b_next!9369))))

(declare-fun tp!33636 () Bool)

(declare-fun b_and!16755 () Bool)

(assert (=> start!39102 (= tp!33636 b_and!16755)))

(declare-fun b!410907 () Bool)

(declare-fun e!246198 () Bool)

(declare-fun tp_is_empty!10521 () Bool)

(assert (=> b!410907 (= e!246198 tp_is_empty!10521)))

(declare-fun b!410908 () Bool)

(declare-fun res!238274 () Bool)

(declare-fun e!246195 () Bool)

(assert (=> b!410908 (=> (not res!238274) (not e!246195))))

(declare-datatypes ((array!24903 0))(
  ( (array!24904 (arr!11901 (Array (_ BitVec 32) (_ BitVec 64))) (size!12253 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24903)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410908 (= res!238274 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17403 () Bool)

(declare-fun mapRes!17403 () Bool)

(declare-fun tp!33635 () Bool)

(assert (=> mapNonEmpty!17403 (= mapRes!17403 (and tp!33635 e!246198))))

(declare-datatypes ((V!15133 0))(
  ( (V!15134 (val!5305 Int)) )
))
(declare-datatypes ((ValueCell!4917 0))(
  ( (ValueCellFull!4917 (v!7552 V!15133)) (EmptyCell!4917) )
))
(declare-fun mapValue!17403 () ValueCell!4917)

(declare-fun mapRest!17403 () (Array (_ BitVec 32) ValueCell!4917))

(declare-datatypes ((array!24905 0))(
  ( (array!24906 (arr!11902 (Array (_ BitVec 32) ValueCell!4917)) (size!12254 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24905)

(declare-fun mapKey!17403 () (_ BitVec 32))

(assert (=> mapNonEmpty!17403 (= (arr!11902 _values!549) (store mapRest!17403 mapKey!17403 mapValue!17403))))

(declare-fun b!410909 () Bool)

(declare-fun res!238265 () Bool)

(assert (=> b!410909 (=> (not res!238265) (not e!246195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410909 (= res!238265 (validKeyInArray!0 k0!794))))

(declare-fun b!410910 () Bool)

(declare-fun res!238271 () Bool)

(assert (=> b!410910 (=> (not res!238271) (not e!246195))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410910 (= res!238271 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12253 _keys!709))))))

(declare-fun b!410911 () Bool)

(declare-fun e!246196 () Bool)

(assert (=> b!410911 (= e!246196 tp_is_empty!10521)))

(declare-fun mapIsEmpty!17403 () Bool)

(assert (=> mapIsEmpty!17403 mapRes!17403))

(declare-fun b!410912 () Bool)

(declare-fun e!246194 () Bool)

(assert (=> b!410912 (= e!246195 e!246194)))

(declare-fun res!238272 () Bool)

(assert (=> b!410912 (=> (not res!238272) (not e!246194))))

(declare-fun lt!189175 () array!24903)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24903 (_ BitVec 32)) Bool)

(assert (=> b!410912 (= res!238272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189175 mask!1025))))

(assert (=> b!410912 (= lt!189175 (array!24904 (store (arr!11901 _keys!709) i!563 k0!794) (size!12253 _keys!709)))))

(declare-fun b!410913 () Bool)

(declare-fun e!246197 () Bool)

(assert (=> b!410913 (= e!246197 (and e!246196 mapRes!17403))))

(declare-fun condMapEmpty!17403 () Bool)

(declare-fun mapDefault!17403 () ValueCell!4917)

(assert (=> b!410913 (= condMapEmpty!17403 (= (arr!11902 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4917)) mapDefault!17403)))))

(declare-fun b!410914 () Bool)

(assert (=> b!410914 (= e!246194 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15133)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15133)

(declare-datatypes ((tuple2!6878 0))(
  ( (tuple2!6879 (_1!3450 (_ BitVec 64)) (_2!3450 V!15133)) )
))
(declare-datatypes ((List!6903 0))(
  ( (Nil!6900) (Cons!6899 (h!7755 tuple2!6878) (t!12077 List!6903)) )
))
(declare-datatypes ((ListLongMap!5791 0))(
  ( (ListLongMap!5792 (toList!2911 List!6903)) )
))
(declare-fun lt!189174 () ListLongMap!5791)

(declare-fun v!412 () V!15133)

(declare-fun getCurrentListMapNoExtraKeys!1119 (array!24903 array!24905 (_ BitVec 32) (_ BitVec 32) V!15133 V!15133 (_ BitVec 32) Int) ListLongMap!5791)

(assert (=> b!410914 (= lt!189174 (getCurrentListMapNoExtraKeys!1119 lt!189175 (array!24906 (store (arr!11902 _values!549) i!563 (ValueCellFull!4917 v!412)) (size!12254 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189176 () ListLongMap!5791)

(assert (=> b!410914 (= lt!189176 (getCurrentListMapNoExtraKeys!1119 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410915 () Bool)

(declare-fun res!238268 () Bool)

(assert (=> b!410915 (=> (not res!238268) (not e!246195))))

(assert (=> b!410915 (= res!238268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!238273 () Bool)

(assert (=> start!39102 (=> (not res!238273) (not e!246195))))

(assert (=> start!39102 (= res!238273 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12253 _keys!709))))))

(assert (=> start!39102 e!246195))

(assert (=> start!39102 tp_is_empty!10521))

(assert (=> start!39102 tp!33636))

(assert (=> start!39102 true))

(declare-fun array_inv!8684 (array!24905) Bool)

(assert (=> start!39102 (and (array_inv!8684 _values!549) e!246197)))

(declare-fun array_inv!8685 (array!24903) Bool)

(assert (=> start!39102 (array_inv!8685 _keys!709)))

(declare-fun b!410916 () Bool)

(declare-fun res!238275 () Bool)

(assert (=> b!410916 (=> (not res!238275) (not e!246195))))

(assert (=> b!410916 (= res!238275 (and (= (size!12254 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12253 _keys!709) (size!12254 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410917 () Bool)

(declare-fun res!238269 () Bool)

(assert (=> b!410917 (=> (not res!238269) (not e!246194))))

(assert (=> b!410917 (= res!238269 (bvsle from!863 i!563))))

(declare-fun b!410918 () Bool)

(declare-fun res!238264 () Bool)

(assert (=> b!410918 (=> (not res!238264) (not e!246195))))

(assert (=> b!410918 (= res!238264 (or (= (select (arr!11901 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11901 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410919 () Bool)

(declare-fun res!238267 () Bool)

(assert (=> b!410919 (=> (not res!238267) (not e!246194))))

(declare-datatypes ((List!6904 0))(
  ( (Nil!6901) (Cons!6900 (h!7756 (_ BitVec 64)) (t!12078 List!6904)) )
))
(declare-fun arrayNoDuplicates!0 (array!24903 (_ BitVec 32) List!6904) Bool)

(assert (=> b!410919 (= res!238267 (arrayNoDuplicates!0 lt!189175 #b00000000000000000000000000000000 Nil!6901))))

(declare-fun b!410920 () Bool)

(declare-fun res!238270 () Bool)

(assert (=> b!410920 (=> (not res!238270) (not e!246195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410920 (= res!238270 (validMask!0 mask!1025))))

(declare-fun b!410921 () Bool)

(declare-fun res!238266 () Bool)

(assert (=> b!410921 (=> (not res!238266) (not e!246195))))

(assert (=> b!410921 (= res!238266 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6901))))

(assert (= (and start!39102 res!238273) b!410920))

(assert (= (and b!410920 res!238270) b!410916))

(assert (= (and b!410916 res!238275) b!410915))

(assert (= (and b!410915 res!238268) b!410921))

(assert (= (and b!410921 res!238266) b!410910))

(assert (= (and b!410910 res!238271) b!410909))

(assert (= (and b!410909 res!238265) b!410918))

(assert (= (and b!410918 res!238264) b!410908))

(assert (= (and b!410908 res!238274) b!410912))

(assert (= (and b!410912 res!238272) b!410919))

(assert (= (and b!410919 res!238267) b!410917))

(assert (= (and b!410917 res!238269) b!410914))

(assert (= (and b!410913 condMapEmpty!17403) mapIsEmpty!17403))

(assert (= (and b!410913 (not condMapEmpty!17403)) mapNonEmpty!17403))

(get-info :version)

(assert (= (and mapNonEmpty!17403 ((_ is ValueCellFull!4917) mapValue!17403)) b!410907))

(assert (= (and b!410913 ((_ is ValueCellFull!4917) mapDefault!17403)) b!410911))

(assert (= start!39102 b!410913))

(declare-fun m!401233 () Bool)

(assert (=> mapNonEmpty!17403 m!401233))

(declare-fun m!401235 () Bool)

(assert (=> b!410918 m!401235))

(declare-fun m!401237 () Bool)

(assert (=> b!410912 m!401237))

(declare-fun m!401239 () Bool)

(assert (=> b!410912 m!401239))

(declare-fun m!401241 () Bool)

(assert (=> b!410908 m!401241))

(declare-fun m!401243 () Bool)

(assert (=> b!410914 m!401243))

(declare-fun m!401245 () Bool)

(assert (=> b!410914 m!401245))

(declare-fun m!401247 () Bool)

(assert (=> b!410914 m!401247))

(declare-fun m!401249 () Bool)

(assert (=> b!410920 m!401249))

(declare-fun m!401251 () Bool)

(assert (=> b!410921 m!401251))

(declare-fun m!401253 () Bool)

(assert (=> b!410919 m!401253))

(declare-fun m!401255 () Bool)

(assert (=> b!410909 m!401255))

(declare-fun m!401257 () Bool)

(assert (=> b!410915 m!401257))

(declare-fun m!401259 () Bool)

(assert (=> start!39102 m!401259))

(declare-fun m!401261 () Bool)

(assert (=> start!39102 m!401261))

(check-sat (not b!410914) (not b!410915) (not b_next!9369) (not b!410921) (not mapNonEmpty!17403) (not start!39102) (not b!410919) (not b!410912) b_and!16755 (not b!410909) (not b!410908) (not b!410920) tp_is_empty!10521)
(check-sat b_and!16755 (not b_next!9369))
