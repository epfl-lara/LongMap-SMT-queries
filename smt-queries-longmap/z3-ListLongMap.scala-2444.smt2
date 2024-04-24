; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38468 () Bool)

(assert start!38468)

(declare-fun mapIsEmpty!16473 () Bool)

(declare-fun mapRes!16473 () Bool)

(assert (=> mapIsEmpty!16473 mapRes!16473))

(declare-fun res!228091 () Bool)

(declare-fun e!240262 () Bool)

(assert (=> start!38468 (=> (not res!228091) (not e!240262))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23702 0))(
  ( (array!23703 (arr!11300 (Array (_ BitVec 32) (_ BitVec 64))) (size!11652 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23702)

(assert (=> start!38468 (= res!228091 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11652 _keys!709))))))

(assert (=> start!38468 e!240262))

(assert (=> start!38468 true))

(declare-datatypes ((V!14307 0))(
  ( (V!14308 (val!4995 Int)) )
))
(declare-datatypes ((ValueCell!4607 0))(
  ( (ValueCellFull!4607 (v!7243 V!14307)) (EmptyCell!4607) )
))
(declare-datatypes ((array!23704 0))(
  ( (array!23705 (arr!11301 (Array (_ BitVec 32) ValueCell!4607)) (size!11653 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23704)

(declare-fun e!240260 () Bool)

(declare-fun array_inv!8350 (array!23704) Bool)

(assert (=> start!38468 (and (array_inv!8350 _values!549) e!240260)))

(declare-fun array_inv!8351 (array!23702) Bool)

(assert (=> start!38468 (array_inv!8351 _keys!709)))

(declare-fun b!397246 () Bool)

(declare-fun res!228090 () Bool)

(assert (=> b!397246 (=> (not res!228090) (not e!240262))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397246 (= res!228090 (validKeyInArray!0 k0!794))))

(declare-fun b!397247 () Bool)

(declare-fun res!228089 () Bool)

(assert (=> b!397247 (=> (not res!228089) (not e!240262))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23702 (_ BitVec 32)) Bool)

(assert (=> b!397247 (= res!228089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397248 () Bool)

(declare-fun e!240261 () Bool)

(assert (=> b!397248 (= e!240260 (and e!240261 mapRes!16473))))

(declare-fun condMapEmpty!16473 () Bool)

(declare-fun mapDefault!16473 () ValueCell!4607)

(assert (=> b!397248 (= condMapEmpty!16473 (= (arr!11301 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4607)) mapDefault!16473)))))

(declare-fun b!397249 () Bool)

(declare-fun res!228095 () Bool)

(assert (=> b!397249 (=> (not res!228095) (not e!240262))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397249 (= res!228095 (and (= (size!11653 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11652 _keys!709) (size!11653 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397250 () Bool)

(declare-fun e!240259 () Bool)

(assert (=> b!397250 (= e!240259 false)))

(declare-fun lt!187301 () Bool)

(declare-fun lt!187302 () array!23702)

(declare-datatypes ((List!6411 0))(
  ( (Nil!6408) (Cons!6407 (h!7263 (_ BitVec 64)) (t!11577 List!6411)) )
))
(declare-fun arrayNoDuplicates!0 (array!23702 (_ BitVec 32) List!6411) Bool)

(assert (=> b!397250 (= lt!187301 (arrayNoDuplicates!0 lt!187302 #b00000000000000000000000000000000 Nil!6408))))

(declare-fun mapNonEmpty!16473 () Bool)

(declare-fun tp!32268 () Bool)

(declare-fun e!240258 () Bool)

(assert (=> mapNonEmpty!16473 (= mapRes!16473 (and tp!32268 e!240258))))

(declare-fun mapRest!16473 () (Array (_ BitVec 32) ValueCell!4607))

(declare-fun mapValue!16473 () ValueCell!4607)

(declare-fun mapKey!16473 () (_ BitVec 32))

(assert (=> mapNonEmpty!16473 (= (arr!11301 _values!549) (store mapRest!16473 mapKey!16473 mapValue!16473))))

(declare-fun b!397251 () Bool)

(declare-fun res!228096 () Bool)

(assert (=> b!397251 (=> (not res!228096) (not e!240262))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397251 (= res!228096 (or (= (select (arr!11300 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11300 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397252 () Bool)

(declare-fun res!228094 () Bool)

(assert (=> b!397252 (=> (not res!228094) (not e!240262))))

(declare-fun arrayContainsKey!0 (array!23702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397252 (= res!228094 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397253 () Bool)

(declare-fun tp_is_empty!9901 () Bool)

(assert (=> b!397253 (= e!240258 tp_is_empty!9901)))

(declare-fun b!397254 () Bool)

(declare-fun res!228087 () Bool)

(assert (=> b!397254 (=> (not res!228087) (not e!240262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397254 (= res!228087 (validMask!0 mask!1025))))

(declare-fun b!397255 () Bool)

(assert (=> b!397255 (= e!240262 e!240259)))

(declare-fun res!228088 () Bool)

(assert (=> b!397255 (=> (not res!228088) (not e!240259))))

(assert (=> b!397255 (= res!228088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187302 mask!1025))))

(assert (=> b!397255 (= lt!187302 (array!23703 (store (arr!11300 _keys!709) i!563 k0!794) (size!11652 _keys!709)))))

(declare-fun b!397256 () Bool)

(declare-fun res!228092 () Bool)

(assert (=> b!397256 (=> (not res!228092) (not e!240262))))

(assert (=> b!397256 (= res!228092 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11652 _keys!709))))))

(declare-fun b!397257 () Bool)

(assert (=> b!397257 (= e!240261 tp_is_empty!9901)))

(declare-fun b!397258 () Bool)

(declare-fun res!228093 () Bool)

(assert (=> b!397258 (=> (not res!228093) (not e!240262))))

(assert (=> b!397258 (= res!228093 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6408))))

(assert (= (and start!38468 res!228091) b!397254))

(assert (= (and b!397254 res!228087) b!397249))

(assert (= (and b!397249 res!228095) b!397247))

(assert (= (and b!397247 res!228089) b!397258))

(assert (= (and b!397258 res!228093) b!397256))

(assert (= (and b!397256 res!228092) b!397246))

(assert (= (and b!397246 res!228090) b!397251))

(assert (= (and b!397251 res!228096) b!397252))

(assert (= (and b!397252 res!228094) b!397255))

(assert (= (and b!397255 res!228088) b!397250))

(assert (= (and b!397248 condMapEmpty!16473) mapIsEmpty!16473))

(assert (= (and b!397248 (not condMapEmpty!16473)) mapNonEmpty!16473))

(get-info :version)

(assert (= (and mapNonEmpty!16473 ((_ is ValueCellFull!4607) mapValue!16473)) b!397253))

(assert (= (and b!397248 ((_ is ValueCellFull!4607) mapDefault!16473)) b!397257))

(assert (= start!38468 b!397248))

(declare-fun m!392829 () Bool)

(assert (=> b!397258 m!392829))

(declare-fun m!392831 () Bool)

(assert (=> b!397250 m!392831))

(declare-fun m!392833 () Bool)

(assert (=> b!397251 m!392833))

(declare-fun m!392835 () Bool)

(assert (=> b!397247 m!392835))

(declare-fun m!392837 () Bool)

(assert (=> b!397252 m!392837))

(declare-fun m!392839 () Bool)

(assert (=> b!397255 m!392839))

(declare-fun m!392841 () Bool)

(assert (=> b!397255 m!392841))

(declare-fun m!392843 () Bool)

(assert (=> start!38468 m!392843))

(declare-fun m!392845 () Bool)

(assert (=> start!38468 m!392845))

(declare-fun m!392847 () Bool)

(assert (=> b!397254 m!392847))

(declare-fun m!392849 () Bool)

(assert (=> b!397246 m!392849))

(declare-fun m!392851 () Bool)

(assert (=> mapNonEmpty!16473 m!392851))

(check-sat (not b!397254) (not b!397252) (not b!397247) (not start!38468) tp_is_empty!9901 (not b!397250) (not mapNonEmpty!16473) (not b!397255) (not b!397246) (not b!397258))
(check-sat)
