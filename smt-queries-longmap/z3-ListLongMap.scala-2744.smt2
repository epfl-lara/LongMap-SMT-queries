; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40288 () Bool)

(assert start!40288)

(declare-fun b!442505 () Bool)

(declare-fun res!262119 () Bool)

(declare-fun e!260437 () Bool)

(assert (=> b!442505 (=> (not res!262119) (not e!260437))))

(declare-datatypes ((array!27220 0))(
  ( (array!27221 (arr!13058 (Array (_ BitVec 32) (_ BitVec 64))) (size!13410 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27220)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27220 (_ BitVec 32)) Bool)

(assert (=> b!442505 (= res!262119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442506 () Bool)

(declare-fun e!260436 () Bool)

(declare-fun tp_is_empty!11701 () Bool)

(assert (=> b!442506 (= e!260436 tp_is_empty!11701)))

(declare-fun b!442507 () Bool)

(declare-fun e!260438 () Bool)

(assert (=> b!442507 (= e!260438 tp_is_empty!11701)))

(declare-fun b!442508 () Bool)

(declare-fun res!262121 () Bool)

(assert (=> b!442508 (=> (not res!262121) (not e!260437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442508 (= res!262121 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19176 () Bool)

(declare-fun mapRes!19176 () Bool)

(declare-fun tp!37158 () Bool)

(assert (=> mapNonEmpty!19176 (= mapRes!19176 (and tp!37158 e!260438))))

(declare-datatypes ((V!16707 0))(
  ( (V!16708 (val!5895 Int)) )
))
(declare-datatypes ((ValueCell!5507 0))(
  ( (ValueCellFull!5507 (v!8147 V!16707)) (EmptyCell!5507) )
))
(declare-fun mapValue!19176 () ValueCell!5507)

(declare-datatypes ((array!27222 0))(
  ( (array!27223 (arr!13059 (Array (_ BitVec 32) ValueCell!5507)) (size!13411 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27222)

(declare-fun mapRest!19176 () (Array (_ BitVec 32) ValueCell!5507))

(declare-fun mapKey!19176 () (_ BitVec 32))

(assert (=> mapNonEmpty!19176 (= (arr!13059 _values!549) (store mapRest!19176 mapKey!19176 mapValue!19176))))

(declare-fun b!442509 () Bool)

(assert (=> b!442509 (= e!260437 false)))

(declare-fun lt!203235 () Bool)

(declare-datatypes ((List!7741 0))(
  ( (Nil!7738) (Cons!7737 (h!8593 (_ BitVec 64)) (t!13491 List!7741)) )
))
(declare-fun arrayNoDuplicates!0 (array!27220 (_ BitVec 32) List!7741) Bool)

(assert (=> b!442509 (= lt!203235 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7738))))

(declare-fun res!262118 () Bool)

(assert (=> start!40288 (=> (not res!262118) (not e!260437))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40288 (= res!262118 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13410 _keys!709))))))

(assert (=> start!40288 e!260437))

(assert (=> start!40288 true))

(declare-fun e!260434 () Bool)

(declare-fun array_inv!9540 (array!27222) Bool)

(assert (=> start!40288 (and (array_inv!9540 _values!549) e!260434)))

(declare-fun array_inv!9541 (array!27220) Bool)

(assert (=> start!40288 (array_inv!9541 _keys!709)))

(declare-fun mapIsEmpty!19176 () Bool)

(assert (=> mapIsEmpty!19176 mapRes!19176))

(declare-fun b!442510 () Bool)

(declare-fun res!262120 () Bool)

(assert (=> b!442510 (=> (not res!262120) (not e!260437))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442510 (= res!262120 (and (= (size!13411 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13410 _keys!709) (size!13411 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442511 () Bool)

(assert (=> b!442511 (= e!260434 (and e!260436 mapRes!19176))))

(declare-fun condMapEmpty!19176 () Bool)

(declare-fun mapDefault!19176 () ValueCell!5507)

(assert (=> b!442511 (= condMapEmpty!19176 (= (arr!13059 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5507)) mapDefault!19176)))))

(assert (= (and start!40288 res!262118) b!442508))

(assert (= (and b!442508 res!262121) b!442510))

(assert (= (and b!442510 res!262120) b!442505))

(assert (= (and b!442505 res!262119) b!442509))

(assert (= (and b!442511 condMapEmpty!19176) mapIsEmpty!19176))

(assert (= (and b!442511 (not condMapEmpty!19176)) mapNonEmpty!19176))

(get-info :version)

(assert (= (and mapNonEmpty!19176 ((_ is ValueCellFull!5507) mapValue!19176)) b!442507))

(assert (= (and b!442511 ((_ is ValueCellFull!5507) mapDefault!19176)) b!442506))

(assert (= start!40288 b!442511))

(declare-fun m!429393 () Bool)

(assert (=> b!442509 m!429393))

(declare-fun m!429395 () Bool)

(assert (=> b!442508 m!429395))

(declare-fun m!429397 () Bool)

(assert (=> start!40288 m!429397))

(declare-fun m!429399 () Bool)

(assert (=> start!40288 m!429399))

(declare-fun m!429401 () Bool)

(assert (=> b!442505 m!429401))

(declare-fun m!429403 () Bool)

(assert (=> mapNonEmpty!19176 m!429403))

(check-sat tp_is_empty!11701 (not b!442505) (not b!442509) (not start!40288) (not mapNonEmpty!19176) (not b!442508))
(check-sat)
