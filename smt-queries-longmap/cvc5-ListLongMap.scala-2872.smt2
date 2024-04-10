; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41352 () Bool)

(assert start!41352)

(declare-fun b!462239 () Bool)

(declare-fun e!269678 () Bool)

(declare-fun tp_is_empty!12469 () Bool)

(assert (=> b!462239 (= e!269678 tp_is_empty!12469)))

(declare-fun b!462240 () Bool)

(declare-fun e!269679 () Bool)

(assert (=> b!462240 (= e!269679 false)))

(declare-fun lt!209177 () Bool)

(declare-datatypes ((array!28741 0))(
  ( (array!28742 (arr!13804 (Array (_ BitVec 32) (_ BitVec 64))) (size!14156 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28741)

(declare-datatypes ((List!8335 0))(
  ( (Nil!8332) (Cons!8331 (h!9187 (_ BitVec 64)) (t!14279 List!8335)) )
))
(declare-fun arrayNoDuplicates!0 (array!28741 (_ BitVec 32) List!8335) Bool)

(assert (=> b!462240 (= lt!209177 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8332))))

(declare-fun b!462241 () Bool)

(declare-fun res!276467 () Bool)

(assert (=> b!462241 (=> (not res!276467) (not e!269679))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28741 (_ BitVec 32)) Bool)

(assert (=> b!462241 (= res!276467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462242 () Bool)

(declare-fun e!269682 () Bool)

(declare-fun e!269680 () Bool)

(declare-fun mapRes!20374 () Bool)

(assert (=> b!462242 (= e!269682 (and e!269680 mapRes!20374))))

(declare-fun condMapEmpty!20374 () Bool)

(declare-datatypes ((V!17731 0))(
  ( (V!17732 (val!6279 Int)) )
))
(declare-datatypes ((ValueCell!5891 0))(
  ( (ValueCellFull!5891 (v!8566 V!17731)) (EmptyCell!5891) )
))
(declare-datatypes ((array!28743 0))(
  ( (array!28744 (arr!13805 (Array (_ BitVec 32) ValueCell!5891)) (size!14157 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28743)

(declare-fun mapDefault!20374 () ValueCell!5891)

