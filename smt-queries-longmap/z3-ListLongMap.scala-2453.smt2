; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38538 () Bool)

(assert start!38538)

(declare-fun b!398387 () Bool)

(declare-fun res!228932 () Bool)

(declare-fun e!240794 () Bool)

(assert (=> b!398387 (=> (not res!228932) (not e!240794))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23825 0))(
  ( (array!23826 (arr!11362 (Array (_ BitVec 32) (_ BitVec 64))) (size!11714 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23825)

(assert (=> b!398387 (= res!228932 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11714 _keys!709))))))

(declare-fun mapNonEmpty!16557 () Bool)

(declare-fun mapRes!16557 () Bool)

(declare-fun tp!32352 () Bool)

(declare-fun e!240795 () Bool)

(assert (=> mapNonEmpty!16557 (= mapRes!16557 (and tp!32352 e!240795))))

(declare-fun mapKey!16557 () (_ BitVec 32))

(declare-datatypes ((V!14381 0))(
  ( (V!14382 (val!5023 Int)) )
))
(declare-datatypes ((ValueCell!4635 0))(
  ( (ValueCellFull!4635 (v!7270 V!14381)) (EmptyCell!4635) )
))
(declare-datatypes ((array!23827 0))(
  ( (array!23828 (arr!11363 (Array (_ BitVec 32) ValueCell!4635)) (size!11715 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23827)

(declare-fun mapValue!16557 () ValueCell!4635)

(declare-fun mapRest!16557 () (Array (_ BitVec 32) ValueCell!4635))

(assert (=> mapNonEmpty!16557 (= (arr!11363 _values!549) (store mapRest!16557 mapKey!16557 mapValue!16557))))

(declare-fun b!398388 () Bool)

(declare-fun res!228938 () Bool)

(assert (=> b!398388 (=> (not res!228938) (not e!240794))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398388 (= res!228938 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16557 () Bool)

(assert (=> mapIsEmpty!16557 mapRes!16557))

(declare-fun b!398389 () Bool)

(declare-fun e!240796 () Bool)

(declare-fun e!240798 () Bool)

(assert (=> b!398389 (= e!240796 (and e!240798 mapRes!16557))))

(declare-fun condMapEmpty!16557 () Bool)

(declare-fun mapDefault!16557 () ValueCell!4635)

(assert (=> b!398389 (= condMapEmpty!16557 (= (arr!11363 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4635)) mapDefault!16557)))))

(declare-fun b!398390 () Bool)

(declare-fun e!240793 () Bool)

(assert (=> b!398390 (= e!240794 e!240793)))

(declare-fun res!228934 () Bool)

(assert (=> b!398390 (=> (not res!228934) (not e!240793))))

(declare-fun lt!187450 () array!23825)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23825 (_ BitVec 32)) Bool)

(assert (=> b!398390 (= res!228934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187450 mask!1025))))

(assert (=> b!398390 (= lt!187450 (array!23826 (store (arr!11362 _keys!709) i!563 k0!794) (size!11714 _keys!709)))))

(declare-fun b!398391 () Bool)

(declare-fun res!228933 () Bool)

(assert (=> b!398391 (=> (not res!228933) (not e!240794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398391 (= res!228933 (validKeyInArray!0 k0!794))))

(declare-fun b!398392 () Bool)

(declare-fun res!228936 () Bool)

(assert (=> b!398392 (=> (not res!228936) (not e!240794))))

(assert (=> b!398392 (= res!228936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398393 () Bool)

(declare-fun res!228931 () Bool)

(assert (=> b!398393 (=> (not res!228931) (not e!240794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398393 (= res!228931 (validMask!0 mask!1025))))

(declare-fun b!398394 () Bool)

(declare-fun res!228939 () Bool)

(assert (=> b!398394 (=> (not res!228939) (not e!240794))))

(assert (=> b!398394 (= res!228939 (or (= (select (arr!11362 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11362 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!228935 () Bool)

(assert (=> start!38538 (=> (not res!228935) (not e!240794))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38538 (= res!228935 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11714 _keys!709))))))

(assert (=> start!38538 e!240794))

(assert (=> start!38538 true))

(declare-fun array_inv!8328 (array!23827) Bool)

(assert (=> start!38538 (and (array_inv!8328 _values!549) e!240796)))

(declare-fun array_inv!8329 (array!23825) Bool)

(assert (=> start!38538 (array_inv!8329 _keys!709)))

(declare-fun b!398395 () Bool)

(declare-fun tp_is_empty!9957 () Bool)

(assert (=> b!398395 (= e!240798 tp_is_empty!9957)))

(declare-fun b!398396 () Bool)

(declare-fun res!228937 () Bool)

(assert (=> b!398396 (=> (not res!228937) (not e!240794))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!398396 (= res!228937 (and (= (size!11715 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11714 _keys!709) (size!11715 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398397 () Bool)

(assert (=> b!398397 (= e!240795 tp_is_empty!9957)))

(declare-fun b!398398 () Bool)

(assert (=> b!398398 (= e!240793 false)))

(declare-fun lt!187451 () Bool)

(declare-datatypes ((List!6570 0))(
  ( (Nil!6567) (Cons!6566 (h!7422 (_ BitVec 64)) (t!11744 List!6570)) )
))
(declare-fun arrayNoDuplicates!0 (array!23825 (_ BitVec 32) List!6570) Bool)

(assert (=> b!398398 (= lt!187451 (arrayNoDuplicates!0 lt!187450 #b00000000000000000000000000000000 Nil!6567))))

(declare-fun b!398399 () Bool)

(declare-fun res!228930 () Bool)

(assert (=> b!398399 (=> (not res!228930) (not e!240794))))

(assert (=> b!398399 (= res!228930 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6567))))

(assert (= (and start!38538 res!228935) b!398393))

(assert (= (and b!398393 res!228931) b!398396))

(assert (= (and b!398396 res!228937) b!398392))

(assert (= (and b!398392 res!228936) b!398399))

(assert (= (and b!398399 res!228930) b!398387))

(assert (= (and b!398387 res!228932) b!398391))

(assert (= (and b!398391 res!228933) b!398394))

(assert (= (and b!398394 res!228939) b!398388))

(assert (= (and b!398388 res!228938) b!398390))

(assert (= (and b!398390 res!228934) b!398398))

(assert (= (and b!398389 condMapEmpty!16557) mapIsEmpty!16557))

(assert (= (and b!398389 (not condMapEmpty!16557)) mapNonEmpty!16557))

(get-info :version)

(assert (= (and mapNonEmpty!16557 ((_ is ValueCellFull!4635) mapValue!16557)) b!398397))

(assert (= (and b!398389 ((_ is ValueCellFull!4635) mapDefault!16557)) b!398395))

(assert (= start!38538 b!398389))

(declare-fun m!393271 () Bool)

(assert (=> start!38538 m!393271))

(declare-fun m!393273 () Bool)

(assert (=> start!38538 m!393273))

(declare-fun m!393275 () Bool)

(assert (=> b!398388 m!393275))

(declare-fun m!393277 () Bool)

(assert (=> b!398398 m!393277))

(declare-fun m!393279 () Bool)

(assert (=> b!398392 m!393279))

(declare-fun m!393281 () Bool)

(assert (=> b!398399 m!393281))

(declare-fun m!393283 () Bool)

(assert (=> b!398394 m!393283))

(declare-fun m!393285 () Bool)

(assert (=> b!398393 m!393285))

(declare-fun m!393287 () Bool)

(assert (=> b!398391 m!393287))

(declare-fun m!393289 () Bool)

(assert (=> mapNonEmpty!16557 m!393289))

(declare-fun m!393291 () Bool)

(assert (=> b!398390 m!393291))

(declare-fun m!393293 () Bool)

(assert (=> b!398390 m!393293))

(check-sat (not b!398393) (not mapNonEmpty!16557) (not b!398388) tp_is_empty!9957 (not start!38538) (not b!398392) (not b!398398) (not b!398391) (not b!398390) (not b!398399))
(check-sat)
