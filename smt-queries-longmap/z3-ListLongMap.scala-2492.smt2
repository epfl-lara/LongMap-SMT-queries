; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38756 () Bool)

(assert start!38756)

(declare-fun b!404158 () Bool)

(declare-fun res!233058 () Bool)

(declare-fun e!243178 () Bool)

(assert (=> b!404158 (=> (not res!233058) (not e!243178))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404158 (= res!233058 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16905 () Bool)

(declare-fun mapRes!16905 () Bool)

(declare-fun tp!33024 () Bool)

(declare-fun e!243173 () Bool)

(assert (=> mapNonEmpty!16905 (= mapRes!16905 (and tp!33024 e!243173))))

(declare-datatypes ((V!14691 0))(
  ( (V!14692 (val!5139 Int)) )
))
(declare-datatypes ((ValueCell!4751 0))(
  ( (ValueCellFull!4751 (v!7387 V!14691)) (EmptyCell!4751) )
))
(declare-datatypes ((array!24260 0))(
  ( (array!24261 (arr!11579 (Array (_ BitVec 32) ValueCell!4751)) (size!11931 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24260)

(declare-fun mapKey!16905 () (_ BitVec 32))

(declare-fun mapRest!16905 () (Array (_ BitVec 32) ValueCell!4751))

(declare-fun mapValue!16905 () ValueCell!4751)

(assert (=> mapNonEmpty!16905 (= (arr!11579 _values!549) (store mapRest!16905 mapKey!16905 mapValue!16905))))

(declare-fun b!404159 () Bool)

(declare-fun res!233060 () Bool)

(assert (=> b!404159 (=> (not res!233060) (not e!243178))))

(declare-datatypes ((array!24262 0))(
  ( (array!24263 (arr!11580 (Array (_ BitVec 32) (_ BitVec 64))) (size!11932 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24262)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404159 (= res!233060 (and (= (size!11931 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11932 _keys!709) (size!11931 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404160 () Bool)

(declare-fun e!243176 () Bool)

(assert (=> b!404160 (= e!243176 false)))

(declare-fun lt!188165 () Bool)

(declare-fun lt!188166 () array!24262)

(declare-datatypes ((List!6624 0))(
  ( (Nil!6621) (Cons!6620 (h!7476 (_ BitVec 64)) (t!11790 List!6624)) )
))
(declare-fun arrayNoDuplicates!0 (array!24262 (_ BitVec 32) List!6624) Bool)

(assert (=> b!404160 (= lt!188165 (arrayNoDuplicates!0 lt!188166 #b00000000000000000000000000000000 Nil!6621))))

(declare-fun res!233064 () Bool)

(assert (=> start!38756 (=> (not res!233064) (not e!243178))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38756 (= res!233064 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11932 _keys!709))))))

(assert (=> start!38756 e!243178))

(assert (=> start!38756 true))

(declare-fun e!243174 () Bool)

(declare-fun array_inv!8552 (array!24260) Bool)

(assert (=> start!38756 (and (array_inv!8552 _values!549) e!243174)))

(declare-fun array_inv!8553 (array!24262) Bool)

(assert (=> start!38756 (array_inv!8553 _keys!709)))

(declare-fun b!404161 () Bool)

(declare-fun tp_is_empty!10189 () Bool)

(assert (=> b!404161 (= e!243173 tp_is_empty!10189)))

(declare-fun b!404162 () Bool)

(declare-fun res!233063 () Bool)

(assert (=> b!404162 (=> (not res!233063) (not e!243178))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404162 (= res!233063 (or (= (select (arr!11580 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11580 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404163 () Bool)

(declare-fun res!233061 () Bool)

(assert (=> b!404163 (=> (not res!233061) (not e!243178))))

(declare-fun arrayContainsKey!0 (array!24262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404163 (= res!233061 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404164 () Bool)

(assert (=> b!404164 (= e!243178 e!243176)))

(declare-fun res!233059 () Bool)

(assert (=> b!404164 (=> (not res!233059) (not e!243176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24262 (_ BitVec 32)) Bool)

(assert (=> b!404164 (= res!233059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188166 mask!1025))))

(assert (=> b!404164 (= lt!188166 (array!24263 (store (arr!11580 _keys!709) i!563 k0!794) (size!11932 _keys!709)))))

(declare-fun b!404165 () Bool)

(declare-fun e!243175 () Bool)

(assert (=> b!404165 (= e!243174 (and e!243175 mapRes!16905))))

(declare-fun condMapEmpty!16905 () Bool)

(declare-fun mapDefault!16905 () ValueCell!4751)

(assert (=> b!404165 (= condMapEmpty!16905 (= (arr!11579 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4751)) mapDefault!16905)))))

(declare-fun b!404166 () Bool)

(declare-fun res!233056 () Bool)

(assert (=> b!404166 (=> (not res!233056) (not e!243178))))

(assert (=> b!404166 (= res!233056 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6621))))

(declare-fun b!404167 () Bool)

(declare-fun res!233055 () Bool)

(assert (=> b!404167 (=> (not res!233055) (not e!243178))))

(assert (=> b!404167 (= res!233055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404168 () Bool)

(declare-fun res!233062 () Bool)

(assert (=> b!404168 (=> (not res!233062) (not e!243178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404168 (= res!233062 (validMask!0 mask!1025))))

(declare-fun b!404169 () Bool)

(assert (=> b!404169 (= e!243175 tp_is_empty!10189)))

(declare-fun mapIsEmpty!16905 () Bool)

(assert (=> mapIsEmpty!16905 mapRes!16905))

(declare-fun b!404170 () Bool)

(declare-fun res!233057 () Bool)

(assert (=> b!404170 (=> (not res!233057) (not e!243178))))

(assert (=> b!404170 (= res!233057 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11932 _keys!709))))))

(assert (= (and start!38756 res!233064) b!404168))

(assert (= (and b!404168 res!233062) b!404159))

(assert (= (and b!404159 res!233060) b!404167))

(assert (= (and b!404167 res!233055) b!404166))

(assert (= (and b!404166 res!233056) b!404170))

(assert (= (and b!404170 res!233057) b!404158))

(assert (= (and b!404158 res!233058) b!404162))

(assert (= (and b!404162 res!233063) b!404163))

(assert (= (and b!404163 res!233061) b!404164))

(assert (= (and b!404164 res!233059) b!404160))

(assert (= (and b!404165 condMapEmpty!16905) mapIsEmpty!16905))

(assert (= (and b!404165 (not condMapEmpty!16905)) mapNonEmpty!16905))

(get-info :version)

(assert (= (and mapNonEmpty!16905 ((_ is ValueCellFull!4751) mapValue!16905)) b!404161))

(assert (= (and b!404165 ((_ is ValueCellFull!4751) mapDefault!16905)) b!404169))

(assert (= start!38756 b!404165))

(declare-fun m!397365 () Bool)

(assert (=> b!404162 m!397365))

(declare-fun m!397367 () Bool)

(assert (=> b!404158 m!397367))

(declare-fun m!397369 () Bool)

(assert (=> mapNonEmpty!16905 m!397369))

(declare-fun m!397371 () Bool)

(assert (=> b!404167 m!397371))

(declare-fun m!397373 () Bool)

(assert (=> b!404168 m!397373))

(declare-fun m!397375 () Bool)

(assert (=> b!404160 m!397375))

(declare-fun m!397377 () Bool)

(assert (=> b!404166 m!397377))

(declare-fun m!397379 () Bool)

(assert (=> b!404164 m!397379))

(declare-fun m!397381 () Bool)

(assert (=> b!404164 m!397381))

(declare-fun m!397383 () Bool)

(assert (=> b!404163 m!397383))

(declare-fun m!397385 () Bool)

(assert (=> start!38756 m!397385))

(declare-fun m!397387 () Bool)

(assert (=> start!38756 m!397387))

(check-sat tp_is_empty!10189 (not b!404158) (not b!404167) (not start!38756) (not b!404168) (not b!404160) (not mapNonEmpty!16905) (not b!404163) (not b!404166) (not b!404164))
(check-sat)
