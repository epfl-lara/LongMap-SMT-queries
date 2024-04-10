; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38510 () Bool)

(assert start!38510)

(declare-fun b!397842 () Bool)

(declare-fun res!228515 () Bool)

(declare-fun e!240544 () Bool)

(assert (=> b!397842 (=> (not res!228515) (not e!240544))))

(declare-datatypes ((array!23769 0))(
  ( (array!23770 (arr!11334 (Array (_ BitVec 32) (_ BitVec 64))) (size!11686 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23769)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397842 (= res!228515 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!397843 () Bool)

(declare-fun e!240546 () Bool)

(assert (=> b!397843 (= e!240544 e!240546)))

(declare-fun res!228518 () Bool)

(assert (=> b!397843 (=> (not res!228518) (not e!240546))))

(declare-fun lt!187367 () array!23769)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23769 (_ BitVec 32)) Bool)

(assert (=> b!397843 (= res!228518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187367 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397843 (= lt!187367 (array!23770 (store (arr!11334 _keys!709) i!563 k!794) (size!11686 _keys!709)))))

(declare-fun b!397844 () Bool)

(assert (=> b!397844 (= e!240546 false)))

(declare-fun lt!187366 () Bool)

(declare-datatypes ((List!6558 0))(
  ( (Nil!6555) (Cons!6554 (h!7410 (_ BitVec 64)) (t!11732 List!6558)) )
))
(declare-fun arrayNoDuplicates!0 (array!23769 (_ BitVec 32) List!6558) Bool)

(assert (=> b!397844 (= lt!187366 (arrayNoDuplicates!0 lt!187367 #b00000000000000000000000000000000 Nil!6555))))

(declare-fun b!397845 () Bool)

(declare-fun res!228514 () Bool)

(assert (=> b!397845 (=> (not res!228514) (not e!240544))))

(assert (=> b!397845 (= res!228514 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6555))))

(declare-fun b!397846 () Bool)

(declare-fun e!240545 () Bool)

(declare-fun tp_is_empty!9929 () Bool)

(assert (=> b!397846 (= e!240545 tp_is_empty!9929)))

(declare-fun b!397847 () Bool)

(declare-fun res!228512 () Bool)

(assert (=> b!397847 (=> (not res!228512) (not e!240544))))

(assert (=> b!397847 (= res!228512 (or (= (select (arr!11334 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11334 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397848 () Bool)

(declare-fun res!228511 () Bool)

(assert (=> b!397848 (=> (not res!228511) (not e!240544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397848 (= res!228511 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!16515 () Bool)

(declare-fun mapRes!16515 () Bool)

(assert (=> mapIsEmpty!16515 mapRes!16515))

(declare-fun b!397841 () Bool)

(declare-fun res!228519 () Bool)

(assert (=> b!397841 (=> (not res!228519) (not e!240544))))

(assert (=> b!397841 (= res!228519 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11686 _keys!709))))))

(declare-fun res!228510 () Bool)

(assert (=> start!38510 (=> (not res!228510) (not e!240544))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38510 (= res!228510 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11686 _keys!709))))))

(assert (=> start!38510 e!240544))

(assert (=> start!38510 true))

(declare-datatypes ((V!14343 0))(
  ( (V!14344 (val!5009 Int)) )
))
(declare-datatypes ((ValueCell!4621 0))(
  ( (ValueCellFull!4621 (v!7256 V!14343)) (EmptyCell!4621) )
))
(declare-datatypes ((array!23771 0))(
  ( (array!23772 (arr!11335 (Array (_ BitVec 32) ValueCell!4621)) (size!11687 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23771)

(declare-fun e!240542 () Bool)

(declare-fun array_inv!8306 (array!23771) Bool)

(assert (=> start!38510 (and (array_inv!8306 _values!549) e!240542)))

(declare-fun array_inv!8307 (array!23769) Bool)

(assert (=> start!38510 (array_inv!8307 _keys!709)))

(declare-fun b!397849 () Bool)

(declare-fun res!228516 () Bool)

(assert (=> b!397849 (=> (not res!228516) (not e!240544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397849 (= res!228516 (validMask!0 mask!1025))))

(declare-fun b!397850 () Bool)

(declare-fun e!240543 () Bool)

(assert (=> b!397850 (= e!240543 tp_is_empty!9929)))

(declare-fun b!397851 () Bool)

(declare-fun res!228513 () Bool)

(assert (=> b!397851 (=> (not res!228513) (not e!240544))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397851 (= res!228513 (and (= (size!11687 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11686 _keys!709) (size!11687 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16515 () Bool)

(declare-fun tp!32310 () Bool)

(assert (=> mapNonEmpty!16515 (= mapRes!16515 (and tp!32310 e!240545))))

(declare-fun mapRest!16515 () (Array (_ BitVec 32) ValueCell!4621))

(declare-fun mapKey!16515 () (_ BitVec 32))

(declare-fun mapValue!16515 () ValueCell!4621)

(assert (=> mapNonEmpty!16515 (= (arr!11335 _values!549) (store mapRest!16515 mapKey!16515 mapValue!16515))))

(declare-fun b!397852 () Bool)

(assert (=> b!397852 (= e!240542 (and e!240543 mapRes!16515))))

(declare-fun condMapEmpty!16515 () Bool)

(declare-fun mapDefault!16515 () ValueCell!4621)

