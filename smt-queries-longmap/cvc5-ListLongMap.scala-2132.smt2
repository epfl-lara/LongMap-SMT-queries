; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36054 () Bool)

(assert start!36054)

(declare-fun b!361980 () Bool)

(declare-fun res!201382 () Bool)

(declare-fun e!221705 () Bool)

(assert (=> b!361980 (=> (not res!201382) (not e!221705))))

(declare-datatypes ((array!20383 0))(
  ( (array!20384 (arr!9676 (Array (_ BitVec 32) (_ BitVec 64))) (size!10028 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20383)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12195 0))(
  ( (V!12196 (val!4251 Int)) )
))
(declare-datatypes ((ValueCell!3863 0))(
  ( (ValueCellFull!3863 (v!6446 V!12195)) (EmptyCell!3863) )
))
(declare-datatypes ((array!20385 0))(
  ( (array!20386 (arr!9677 (Array (_ BitVec 32) ValueCell!3863)) (size!10029 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20385)

(assert (=> b!361980 (= res!201382 (and (= (size!10029 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10028 _keys!1541) (size!10029 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361981 () Bool)

(declare-fun res!201381 () Bool)

(assert (=> b!361981 (=> (not res!201381) (not e!221705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20383 (_ BitVec 32)) Bool)

(assert (=> b!361981 (= res!201381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361982 () Bool)

(declare-fun e!221707 () Bool)

(declare-fun tp_is_empty!8413 () Bool)

(assert (=> b!361982 (= e!221707 tp_is_empty!8413)))

(declare-fun mapNonEmpty!14154 () Bool)

(declare-fun mapRes!14154 () Bool)

(declare-fun tp!28230 () Bool)

(declare-fun e!221709 () Bool)

(assert (=> mapNonEmpty!14154 (= mapRes!14154 (and tp!28230 e!221709))))

(declare-fun mapValue!14154 () ValueCell!3863)

(declare-fun mapKey!14154 () (_ BitVec 32))

(declare-fun mapRest!14154 () (Array (_ BitVec 32) ValueCell!3863))

(assert (=> mapNonEmpty!14154 (= (arr!9677 _values!1277) (store mapRest!14154 mapKey!14154 mapValue!14154))))

(declare-fun mapIsEmpty!14154 () Bool)

(assert (=> mapIsEmpty!14154 mapRes!14154))

(declare-fun b!361983 () Bool)

(assert (=> b!361983 (= e!221705 false)))

(declare-fun lt!166605 () Bool)

(declare-datatypes ((List!5520 0))(
  ( (Nil!5517) (Cons!5516 (h!6372 (_ BitVec 64)) (t!10670 List!5520)) )
))
(declare-fun arrayNoDuplicates!0 (array!20383 (_ BitVec 32) List!5520) Bool)

(assert (=> b!361983 (= lt!166605 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5517))))

(declare-fun res!201383 () Bool)

(assert (=> start!36054 (=> (not res!201383) (not e!221705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36054 (= res!201383 (validMask!0 mask!1943))))

(assert (=> start!36054 e!221705))

(assert (=> start!36054 true))

(declare-fun e!221708 () Bool)

(declare-fun array_inv!7120 (array!20385) Bool)

(assert (=> start!36054 (and (array_inv!7120 _values!1277) e!221708)))

(declare-fun array_inv!7121 (array!20383) Bool)

(assert (=> start!36054 (array_inv!7121 _keys!1541)))

(declare-fun b!361984 () Bool)

(assert (=> b!361984 (= e!221709 tp_is_empty!8413)))

(declare-fun b!361985 () Bool)

(assert (=> b!361985 (= e!221708 (and e!221707 mapRes!14154))))

(declare-fun condMapEmpty!14154 () Bool)

(declare-fun mapDefault!14154 () ValueCell!3863)

