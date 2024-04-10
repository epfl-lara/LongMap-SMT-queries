; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38976 () Bool)

(assert start!38976)

(declare-fun b!408224 () Bool)

(declare-fun res!236153 () Bool)

(declare-fun e!245062 () Bool)

(assert (=> b!408224 (=> (not res!236153) (not e!245062))))

(declare-datatypes ((array!24667 0))(
  ( (array!24668 (arr!11783 (Array (_ BitVec 32) (_ BitVec 64))) (size!12135 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24667)

(declare-datatypes ((List!6829 0))(
  ( (Nil!6826) (Cons!6825 (h!7681 (_ BitVec 64)) (t!12003 List!6829)) )
))
(declare-fun arrayNoDuplicates!0 (array!24667 (_ BitVec 32) List!6829) Bool)

(assert (=> b!408224 (= res!236153 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6826))))

(declare-fun mapIsEmpty!17214 () Bool)

(declare-fun mapRes!17214 () Bool)

(assert (=> mapIsEmpty!17214 mapRes!17214))

(declare-fun b!408225 () Bool)

(declare-fun res!236150 () Bool)

(assert (=> b!408225 (=> (not res!236150) (not e!245062))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408225 (= res!236150 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408226 () Bool)

(declare-fun res!236156 () Bool)

(assert (=> b!408226 (=> (not res!236156) (not e!245062))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408226 (= res!236156 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12135 _keys!709))))))

(declare-fun b!408227 () Bool)

(declare-fun res!236151 () Bool)

(assert (=> b!408227 (=> (not res!236151) (not e!245062))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408227 (= res!236151 (validMask!0 mask!1025))))

(declare-fun b!408228 () Bool)

(declare-fun res!236157 () Bool)

(assert (=> b!408228 (=> (not res!236157) (not e!245062))))

(declare-datatypes ((V!14965 0))(
  ( (V!14966 (val!5242 Int)) )
))
(declare-datatypes ((ValueCell!4854 0))(
  ( (ValueCellFull!4854 (v!7489 V!14965)) (EmptyCell!4854) )
))
(declare-datatypes ((array!24669 0))(
  ( (array!24670 (arr!11784 (Array (_ BitVec 32) ValueCell!4854)) (size!12136 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24669)

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408228 (= res!236157 (and (= (size!12136 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12135 _keys!709) (size!12136 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408229 () Bool)

(declare-fun e!245064 () Bool)

(assert (=> b!408229 (= e!245062 e!245064)))

(declare-fun res!236152 () Bool)

(assert (=> b!408229 (=> (not res!236152) (not e!245064))))

(declare-fun lt!188765 () array!24667)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24667 (_ BitVec 32)) Bool)

(assert (=> b!408229 (= res!236152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188765 mask!1025))))

(assert (=> b!408229 (= lt!188765 (array!24668 (store (arr!11783 _keys!709) i!563 k0!794) (size!12135 _keys!709)))))

(declare-fun b!408230 () Bool)

(declare-fun res!236149 () Bool)

(assert (=> b!408230 (=> (not res!236149) (not e!245062))))

(assert (=> b!408230 (= res!236149 (or (= (select (arr!11783 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11783 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17214 () Bool)

(declare-fun tp!33333 () Bool)

(declare-fun e!245060 () Bool)

(assert (=> mapNonEmpty!17214 (= mapRes!17214 (and tp!33333 e!245060))))

(declare-fun mapRest!17214 () (Array (_ BitVec 32) ValueCell!4854))

(declare-fun mapKey!17214 () (_ BitVec 32))

(declare-fun mapValue!17214 () ValueCell!4854)

(assert (=> mapNonEmpty!17214 (= (arr!11784 _values!549) (store mapRest!17214 mapKey!17214 mapValue!17214))))

(declare-fun b!408231 () Bool)

(declare-fun res!236148 () Bool)

(assert (=> b!408231 (=> (not res!236148) (not e!245062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408231 (= res!236148 (validKeyInArray!0 k0!794))))

(declare-fun b!408232 () Bool)

(declare-fun e!245063 () Bool)

(declare-fun tp_is_empty!10395 () Bool)

(assert (=> b!408232 (= e!245063 tp_is_empty!10395)))

(declare-fun b!408233 () Bool)

(declare-fun e!245061 () Bool)

(assert (=> b!408233 (= e!245061 (and e!245063 mapRes!17214))))

(declare-fun condMapEmpty!17214 () Bool)

(declare-fun mapDefault!17214 () ValueCell!4854)

(assert (=> b!408233 (= condMapEmpty!17214 (= (arr!11784 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4854)) mapDefault!17214)))))

(declare-fun b!408234 () Bool)

(declare-fun res!236155 () Bool)

(assert (=> b!408234 (=> (not res!236155) (not e!245062))))

(assert (=> b!408234 (= res!236155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!236154 () Bool)

(assert (=> start!38976 (=> (not res!236154) (not e!245062))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38976 (= res!236154 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12135 _keys!709))))))

(assert (=> start!38976 e!245062))

(assert (=> start!38976 true))

(declare-fun array_inv!8594 (array!24669) Bool)

(assert (=> start!38976 (and (array_inv!8594 _values!549) e!245061)))

(declare-fun array_inv!8595 (array!24667) Bool)

(assert (=> start!38976 (array_inv!8595 _keys!709)))

(declare-fun b!408235 () Bool)

(assert (=> b!408235 (= e!245060 tp_is_empty!10395)))

(declare-fun b!408236 () Bool)

(assert (=> b!408236 (= e!245064 false)))

(declare-fun lt!188764 () Bool)

(assert (=> b!408236 (= lt!188764 (arrayNoDuplicates!0 lt!188765 #b00000000000000000000000000000000 Nil!6826))))

(assert (= (and start!38976 res!236154) b!408227))

(assert (= (and b!408227 res!236151) b!408228))

(assert (= (and b!408228 res!236157) b!408234))

(assert (= (and b!408234 res!236155) b!408224))

(assert (= (and b!408224 res!236153) b!408226))

(assert (= (and b!408226 res!236156) b!408231))

(assert (= (and b!408231 res!236148) b!408230))

(assert (= (and b!408230 res!236149) b!408225))

(assert (= (and b!408225 res!236150) b!408229))

(assert (= (and b!408229 res!236152) b!408236))

(assert (= (and b!408233 condMapEmpty!17214) mapIsEmpty!17214))

(assert (= (and b!408233 (not condMapEmpty!17214)) mapNonEmpty!17214))

(get-info :version)

(assert (= (and mapNonEmpty!17214 ((_ is ValueCellFull!4854) mapValue!17214)) b!408235))

(assert (= (and b!408233 ((_ is ValueCellFull!4854) mapDefault!17214)) b!408232))

(assert (= start!38976 b!408233))

(declare-fun m!399607 () Bool)

(assert (=> mapNonEmpty!17214 m!399607))

(declare-fun m!399609 () Bool)

(assert (=> start!38976 m!399609))

(declare-fun m!399611 () Bool)

(assert (=> start!38976 m!399611))

(declare-fun m!399613 () Bool)

(assert (=> b!408224 m!399613))

(declare-fun m!399615 () Bool)

(assert (=> b!408234 m!399615))

(declare-fun m!399617 () Bool)

(assert (=> b!408231 m!399617))

(declare-fun m!399619 () Bool)

(assert (=> b!408225 m!399619))

(declare-fun m!399621 () Bool)

(assert (=> b!408229 m!399621))

(declare-fun m!399623 () Bool)

(assert (=> b!408229 m!399623))

(declare-fun m!399625 () Bool)

(assert (=> b!408230 m!399625))

(declare-fun m!399627 () Bool)

(assert (=> b!408236 m!399627))

(declare-fun m!399629 () Bool)

(assert (=> b!408227 m!399629))

(check-sat (not b!408229) (not start!38976) (not b!408234) (not b!408225) (not b!408236) tp_is_empty!10395 (not b!408231) (not b!408227) (not mapNonEmpty!17214) (not b!408224))
(check-sat)
