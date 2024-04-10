; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38316 () Bool)

(assert start!38316)

(declare-fun b!395167 () Bool)

(declare-fun res!226525 () Bool)

(declare-fun e!239257 () Bool)

(assert (=> b!395167 (=> (not res!226525) (not e!239257))))

(declare-datatypes ((array!23495 0))(
  ( (array!23496 (arr!11201 (Array (_ BitVec 32) (_ BitVec 64))) (size!11553 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23495)

(declare-datatypes ((V!14165 0))(
  ( (V!14166 (val!4942 Int)) )
))
(declare-datatypes ((ValueCell!4554 0))(
  ( (ValueCellFull!4554 (v!7188 V!14165)) (EmptyCell!4554) )
))
(declare-datatypes ((array!23497 0))(
  ( (array!23498 (arr!11202 (Array (_ BitVec 32) ValueCell!4554)) (size!11554 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23497)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395167 (= res!226525 (and (= (size!11554 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11553 _keys!709) (size!11554 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395168 () Bool)

(declare-fun res!226526 () Bool)

(assert (=> b!395168 (=> (not res!226526) (not e!239257))))

(declare-datatypes ((List!6505 0))(
  ( (Nil!6502) (Cons!6501 (h!7357 (_ BitVec 64)) (t!11679 List!6505)) )
))
(declare-fun arrayNoDuplicates!0 (array!23495 (_ BitVec 32) List!6505) Bool)

(assert (=> b!395168 (= res!226526 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6502))))

(declare-fun mapIsEmpty!16302 () Bool)

(declare-fun mapRes!16302 () Bool)

(assert (=> mapIsEmpty!16302 mapRes!16302))

(declare-fun b!395169 () Bool)

(declare-fun e!239258 () Bool)

(declare-fun tp_is_empty!9795 () Bool)

(assert (=> b!395169 (= e!239258 tp_is_empty!9795)))

(declare-fun b!395170 () Bool)

(declare-fun e!239259 () Bool)

(assert (=> b!395170 (= e!239259 tp_is_empty!9795)))

(declare-fun b!395171 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395171 (= e!239257 (and (or (= (select (arr!11201 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11201 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!11553 _keys!709))))))

(declare-fun b!395172 () Bool)

(declare-fun res!226530 () Bool)

(assert (=> b!395172 (=> (not res!226530) (not e!239257))))

(assert (=> b!395172 (= res!226530 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11553 _keys!709))))))

(declare-fun b!395173 () Bool)

(declare-fun e!239260 () Bool)

(assert (=> b!395173 (= e!239260 (and e!239259 mapRes!16302))))

(declare-fun condMapEmpty!16302 () Bool)

(declare-fun mapDefault!16302 () ValueCell!4554)

(assert (=> b!395173 (= condMapEmpty!16302 (= (arr!11202 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4554)) mapDefault!16302)))))

(declare-fun b!395174 () Bool)

(declare-fun res!226531 () Bool)

(assert (=> b!395174 (=> (not res!226531) (not e!239257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395174 (= res!226531 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16302 () Bool)

(declare-fun tp!32097 () Bool)

(assert (=> mapNonEmpty!16302 (= mapRes!16302 (and tp!32097 e!239258))))

(declare-fun mapValue!16302 () ValueCell!4554)

(declare-fun mapRest!16302 () (Array (_ BitVec 32) ValueCell!4554))

(declare-fun mapKey!16302 () (_ BitVec 32))

(assert (=> mapNonEmpty!16302 (= (arr!11202 _values!549) (store mapRest!16302 mapKey!16302 mapValue!16302))))

(declare-fun res!226527 () Bool)

(assert (=> start!38316 (=> (not res!226527) (not e!239257))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38316 (= res!226527 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11553 _keys!709))))))

(assert (=> start!38316 e!239257))

(assert (=> start!38316 true))

(declare-fun array_inv!8220 (array!23497) Bool)

(assert (=> start!38316 (and (array_inv!8220 _values!549) e!239260)))

(declare-fun array_inv!8221 (array!23495) Bool)

(assert (=> start!38316 (array_inv!8221 _keys!709)))

(declare-fun b!395175 () Bool)

(declare-fun res!226528 () Bool)

(assert (=> b!395175 (=> (not res!226528) (not e!239257))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395175 (= res!226528 (validKeyInArray!0 k0!794))))

(declare-fun b!395176 () Bool)

(declare-fun res!226529 () Bool)

(assert (=> b!395176 (=> (not res!226529) (not e!239257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23495 (_ BitVec 32)) Bool)

(assert (=> b!395176 (= res!226529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38316 res!226527) b!395174))

(assert (= (and b!395174 res!226531) b!395167))

(assert (= (and b!395167 res!226525) b!395176))

(assert (= (and b!395176 res!226529) b!395168))

(assert (= (and b!395168 res!226526) b!395172))

(assert (= (and b!395172 res!226530) b!395175))

(assert (= (and b!395175 res!226528) b!395171))

(assert (= (and b!395173 condMapEmpty!16302) mapIsEmpty!16302))

(assert (= (and b!395173 (not condMapEmpty!16302)) mapNonEmpty!16302))

(get-info :version)

(assert (= (and mapNonEmpty!16302 ((_ is ValueCellFull!4554) mapValue!16302)) b!395169))

(assert (= (and b!395173 ((_ is ValueCellFull!4554) mapDefault!16302)) b!395170))

(assert (= start!38316 b!395173))

(declare-fun m!391343 () Bool)

(assert (=> b!395171 m!391343))

(declare-fun m!391345 () Bool)

(assert (=> b!395176 m!391345))

(declare-fun m!391347 () Bool)

(assert (=> b!395168 m!391347))

(declare-fun m!391349 () Bool)

(assert (=> mapNonEmpty!16302 m!391349))

(declare-fun m!391351 () Bool)

(assert (=> b!395174 m!391351))

(declare-fun m!391353 () Bool)

(assert (=> start!38316 m!391353))

(declare-fun m!391355 () Bool)

(assert (=> start!38316 m!391355))

(declare-fun m!391357 () Bool)

(assert (=> b!395175 m!391357))

(check-sat (not b!395174) tp_is_empty!9795 (not b!395175) (not mapNonEmpty!16302) (not b!395168) (not b!395176) (not start!38316))
(check-sat)
