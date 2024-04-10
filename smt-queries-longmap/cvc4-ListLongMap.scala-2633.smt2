; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39620 () Bool)

(assert start!39620)

(declare-fun b_free!9887 () Bool)

(declare-fun b_next!9887 () Bool)

(assert (=> start!39620 (= b_free!9887 (not b_next!9887))))

(declare-fun tp!35189 () Bool)

(declare-fun b_and!17543 () Bool)

(assert (=> start!39620 (= tp!35189 b_and!17543)))

(declare-fun b!424704 () Bool)

(declare-fun e!252245 () Bool)

(declare-fun e!252244 () Bool)

(assert (=> b!424704 (= e!252245 e!252244)))

(declare-fun res!248496 () Bool)

(assert (=> b!424704 (=> (not res!248496) (not e!252244))))

(declare-datatypes ((array!25917 0))(
  ( (array!25918 (arr!12408 (Array (_ BitVec 32) (_ BitVec 64))) (size!12760 (_ BitVec 32))) )
))
(declare-fun lt!194421 () array!25917)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25917 (_ BitVec 32)) Bool)

(assert (=> b!424704 (= res!248496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194421 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!25917)

(assert (=> b!424704 (= lt!194421 (array!25918 (store (arr!12408 _keys!709) i!563 k!794) (size!12760 _keys!709)))))

(declare-fun b!424705 () Bool)

(declare-fun res!248489 () Bool)

(assert (=> b!424705 (=> (not res!248489) (not e!252245))))

(assert (=> b!424705 (= res!248489 (or (= (select (arr!12408 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12408 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424706 () Bool)

(declare-fun e!252243 () Bool)

(declare-fun tp_is_empty!11039 () Bool)

(assert (=> b!424706 (= e!252243 tp_is_empty!11039)))

(declare-fun mapIsEmpty!18180 () Bool)

(declare-fun mapRes!18180 () Bool)

(assert (=> mapIsEmpty!18180 mapRes!18180))

(declare-fun mapNonEmpty!18180 () Bool)

(declare-fun tp!35190 () Bool)

(assert (=> mapNonEmpty!18180 (= mapRes!18180 (and tp!35190 e!252243))))

(declare-datatypes ((V!15823 0))(
  ( (V!15824 (val!5564 Int)) )
))
(declare-datatypes ((ValueCell!5176 0))(
  ( (ValueCellFull!5176 (v!7811 V!15823)) (EmptyCell!5176) )
))
(declare-fun mapValue!18180 () ValueCell!5176)

(declare-datatypes ((array!25919 0))(
  ( (array!25920 (arr!12409 (Array (_ BitVec 32) ValueCell!5176)) (size!12761 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25919)

(declare-fun mapRest!18180 () (Array (_ BitVec 32) ValueCell!5176))

(declare-fun mapKey!18180 () (_ BitVec 32))

(assert (=> mapNonEmpty!18180 (= (arr!12409 _values!549) (store mapRest!18180 mapKey!18180 mapValue!18180))))

(declare-fun res!248495 () Bool)

(assert (=> start!39620 (=> (not res!248495) (not e!252245))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39620 (= res!248495 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12760 _keys!709))))))

(assert (=> start!39620 e!252245))

(assert (=> start!39620 tp_is_empty!11039))

(assert (=> start!39620 tp!35189))

(assert (=> start!39620 true))

(declare-fun e!252242 () Bool)

(declare-fun array_inv!9042 (array!25919) Bool)

(assert (=> start!39620 (and (array_inv!9042 _values!549) e!252242)))

(declare-fun array_inv!9043 (array!25917) Bool)

(assert (=> start!39620 (array_inv!9043 _keys!709)))

(declare-fun b!424707 () Bool)

(declare-fun res!248493 () Bool)

(assert (=> b!424707 (=> (not res!248493) (not e!252244))))

(assert (=> b!424707 (= res!248493 (bvsle from!863 i!563))))

(declare-fun b!424708 () Bool)

(declare-fun res!248492 () Bool)

(assert (=> b!424708 (=> (not res!248492) (not e!252245))))

(declare-fun arrayContainsKey!0 (array!25917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424708 (= res!248492 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!424709 () Bool)

(declare-fun e!252241 () Bool)

(assert (=> b!424709 (= e!252241 tp_is_empty!11039)))

(declare-fun b!424710 () Bool)

(declare-fun res!248491 () Bool)

(assert (=> b!424710 (=> (not res!248491) (not e!252244))))

(declare-datatypes ((List!7317 0))(
  ( (Nil!7314) (Cons!7313 (h!8169 (_ BitVec 64)) (t!12761 List!7317)) )
))
(declare-fun arrayNoDuplicates!0 (array!25917 (_ BitVec 32) List!7317) Bool)

(assert (=> b!424710 (= res!248491 (arrayNoDuplicates!0 lt!194421 #b00000000000000000000000000000000 Nil!7314))))

(declare-fun b!424711 () Bool)

(declare-fun res!248498 () Bool)

(assert (=> b!424711 (=> (not res!248498) (not e!252245))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!424711 (= res!248498 (and (= (size!12761 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12760 _keys!709) (size!12761 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424712 () Bool)

(declare-fun res!248490 () Bool)

(assert (=> b!424712 (=> (not res!248490) (not e!252245))))

(assert (=> b!424712 (= res!248490 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12760 _keys!709))))))

(declare-fun b!424713 () Bool)

(assert (=> b!424713 (= e!252244 false)))

(declare-fun minValue!515 () V!15823)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7306 0))(
  ( (tuple2!7307 (_1!3664 (_ BitVec 64)) (_2!3664 V!15823)) )
))
(declare-datatypes ((List!7318 0))(
  ( (Nil!7315) (Cons!7314 (h!8170 tuple2!7306) (t!12762 List!7318)) )
))
(declare-datatypes ((ListLongMap!6219 0))(
  ( (ListLongMap!6220 (toList!3125 List!7318)) )
))
(declare-fun lt!194423 () ListLongMap!6219)

(declare-fun v!412 () V!15823)

(declare-fun zeroValue!515 () V!15823)

(declare-fun getCurrentListMapNoExtraKeys!1329 (array!25917 array!25919 (_ BitVec 32) (_ BitVec 32) V!15823 V!15823 (_ BitVec 32) Int) ListLongMap!6219)

(assert (=> b!424713 (= lt!194423 (getCurrentListMapNoExtraKeys!1329 lt!194421 (array!25920 (store (arr!12409 _values!549) i!563 (ValueCellFull!5176 v!412)) (size!12761 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194422 () ListLongMap!6219)

(assert (=> b!424713 (= lt!194422 (getCurrentListMapNoExtraKeys!1329 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424714 () Bool)

(declare-fun res!248499 () Bool)

(assert (=> b!424714 (=> (not res!248499) (not e!252245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424714 (= res!248499 (validMask!0 mask!1025))))

(declare-fun b!424715 () Bool)

(declare-fun res!248497 () Bool)

(assert (=> b!424715 (=> (not res!248497) (not e!252245))))

(assert (=> b!424715 (= res!248497 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7314))))

(declare-fun b!424716 () Bool)

(assert (=> b!424716 (= e!252242 (and e!252241 mapRes!18180))))

(declare-fun condMapEmpty!18180 () Bool)

(declare-fun mapDefault!18180 () ValueCell!5176)

