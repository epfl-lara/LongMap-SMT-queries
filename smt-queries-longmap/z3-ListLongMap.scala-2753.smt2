; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40356 () Bool)

(assert start!40356)

(declare-fun b!443512 () Bool)

(declare-fun res!262862 () Bool)

(declare-fun e!260938 () Bool)

(assert (=> b!443512 (=> (not res!262862) (not e!260938))))

(declare-datatypes ((array!27324 0))(
  ( (array!27325 (arr!13109 (Array (_ BitVec 32) (_ BitVec 64))) (size!13461 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27324)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443512 (= res!262862 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443513 () Bool)

(declare-fun res!262865 () Bool)

(assert (=> b!443513 (=> (not res!262865) (not e!260938))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443513 (= res!262865 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13461 _keys!709))))))

(declare-fun b!443514 () Bool)

(declare-fun res!262866 () Bool)

(assert (=> b!443514 (=> (not res!262866) (not e!260938))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16779 0))(
  ( (V!16780 (val!5922 Int)) )
))
(declare-datatypes ((ValueCell!5534 0))(
  ( (ValueCellFull!5534 (v!8174 V!16779)) (EmptyCell!5534) )
))
(declare-datatypes ((array!27326 0))(
  ( (array!27327 (arr!13110 (Array (_ BitVec 32) ValueCell!5534)) (size!13462 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27326)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!443514 (= res!262866 (and (= (size!13462 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13461 _keys!709) (size!13462 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443515 () Bool)

(declare-fun e!260940 () Bool)

(assert (=> b!443515 (= e!260940 false)))

(declare-fun lt!203375 () Bool)

(declare-fun lt!203376 () array!27324)

(declare-datatypes ((List!7764 0))(
  ( (Nil!7761) (Cons!7760 (h!8616 (_ BitVec 64)) (t!13514 List!7764)) )
))
(declare-fun arrayNoDuplicates!0 (array!27324 (_ BitVec 32) List!7764) Bool)

(assert (=> b!443515 (= lt!203375 (arrayNoDuplicates!0 lt!203376 #b00000000000000000000000000000000 Nil!7761))))

(declare-fun b!443516 () Bool)

(declare-fun res!262864 () Bool)

(assert (=> b!443516 (=> (not res!262864) (not e!260938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443516 (= res!262864 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19260 () Bool)

(declare-fun mapRes!19260 () Bool)

(declare-fun tp!37242 () Bool)

(declare-fun e!260936 () Bool)

(assert (=> mapNonEmpty!19260 (= mapRes!19260 (and tp!37242 e!260936))))

(declare-fun mapKey!19260 () (_ BitVec 32))

(declare-fun mapRest!19260 () (Array (_ BitVec 32) ValueCell!5534))

(declare-fun mapValue!19260 () ValueCell!5534)

(assert (=> mapNonEmpty!19260 (= (arr!13110 _values!549) (store mapRest!19260 mapKey!19260 mapValue!19260))))

(declare-fun mapIsEmpty!19260 () Bool)

(assert (=> mapIsEmpty!19260 mapRes!19260))

(declare-fun res!262863 () Bool)

(assert (=> start!40356 (=> (not res!262863) (not e!260938))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40356 (= res!262863 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13461 _keys!709))))))

(assert (=> start!40356 e!260938))

(assert (=> start!40356 true))

(declare-fun e!260937 () Bool)

(declare-fun array_inv!9580 (array!27326) Bool)

(assert (=> start!40356 (and (array_inv!9580 _values!549) e!260937)))

(declare-fun array_inv!9581 (array!27324) Bool)

(assert (=> start!40356 (array_inv!9581 _keys!709)))

(declare-fun b!443517 () Bool)

(declare-fun res!262859 () Bool)

(assert (=> b!443517 (=> (not res!262859) (not e!260938))))

(assert (=> b!443517 (= res!262859 (or (= (select (arr!13109 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13109 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443518 () Bool)

(declare-fun e!260935 () Bool)

(assert (=> b!443518 (= e!260937 (and e!260935 mapRes!19260))))

(declare-fun condMapEmpty!19260 () Bool)

(declare-fun mapDefault!19260 () ValueCell!5534)

(assert (=> b!443518 (= condMapEmpty!19260 (= (arr!13110 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5534)) mapDefault!19260)))))

(declare-fun b!443519 () Bool)

(declare-fun tp_is_empty!11755 () Bool)

(assert (=> b!443519 (= e!260935 tp_is_empty!11755)))

(declare-fun b!443520 () Bool)

(declare-fun res!262861 () Bool)

(assert (=> b!443520 (=> (not res!262861) (not e!260938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443520 (= res!262861 (validMask!0 mask!1025))))

(declare-fun b!443521 () Bool)

(declare-fun res!262860 () Bool)

(assert (=> b!443521 (=> (not res!262860) (not e!260938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27324 (_ BitVec 32)) Bool)

(assert (=> b!443521 (= res!262860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443522 () Bool)

(assert (=> b!443522 (= e!260938 e!260940)))

(declare-fun res!262858 () Bool)

(assert (=> b!443522 (=> (not res!262858) (not e!260940))))

(assert (=> b!443522 (= res!262858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203376 mask!1025))))

(assert (=> b!443522 (= lt!203376 (array!27325 (store (arr!13109 _keys!709) i!563 k0!794) (size!13461 _keys!709)))))

(declare-fun b!443523 () Bool)

(assert (=> b!443523 (= e!260936 tp_is_empty!11755)))

(declare-fun b!443524 () Bool)

(declare-fun res!262867 () Bool)

(assert (=> b!443524 (=> (not res!262867) (not e!260938))))

(assert (=> b!443524 (= res!262867 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7761))))

(assert (= (and start!40356 res!262863) b!443520))

(assert (= (and b!443520 res!262861) b!443514))

(assert (= (and b!443514 res!262866) b!443521))

(assert (= (and b!443521 res!262860) b!443524))

(assert (= (and b!443524 res!262867) b!443513))

(assert (= (and b!443513 res!262865) b!443516))

(assert (= (and b!443516 res!262864) b!443517))

(assert (= (and b!443517 res!262859) b!443512))

(assert (= (and b!443512 res!262862) b!443522))

(assert (= (and b!443522 res!262858) b!443515))

(assert (= (and b!443518 condMapEmpty!19260) mapIsEmpty!19260))

(assert (= (and b!443518 (not condMapEmpty!19260)) mapNonEmpty!19260))

(get-info :version)

(assert (= (and mapNonEmpty!19260 ((_ is ValueCellFull!5534) mapValue!19260)) b!443523))

(assert (= (and b!443518 ((_ is ValueCellFull!5534) mapDefault!19260)) b!443519))

(assert (= start!40356 b!443518))

(declare-fun m!429999 () Bool)

(assert (=> b!443515 m!429999))

(declare-fun m!430001 () Bool)

(assert (=> b!443524 m!430001))

(declare-fun m!430003 () Bool)

(assert (=> b!443522 m!430003))

(declare-fun m!430005 () Bool)

(assert (=> b!443522 m!430005))

(declare-fun m!430007 () Bool)

(assert (=> b!443516 m!430007))

(declare-fun m!430009 () Bool)

(assert (=> start!40356 m!430009))

(declare-fun m!430011 () Bool)

(assert (=> start!40356 m!430011))

(declare-fun m!430013 () Bool)

(assert (=> b!443517 m!430013))

(declare-fun m!430015 () Bool)

(assert (=> b!443512 m!430015))

(declare-fun m!430017 () Bool)

(assert (=> b!443521 m!430017))

(declare-fun m!430019 () Bool)

(assert (=> mapNonEmpty!19260 m!430019))

(declare-fun m!430021 () Bool)

(assert (=> b!443520 m!430021))

(check-sat (not start!40356) (not b!443516) (not mapNonEmpty!19260) (not b!443521) tp_is_empty!11755 (not b!443520) (not b!443515) (not b!443512) (not b!443522) (not b!443524))
(check-sat)
