; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41388 () Bool)

(assert start!41388)

(declare-fun b!462563 () Bool)

(declare-fun res!276629 () Bool)

(declare-fun e!269950 () Bool)

(assert (=> b!462563 (=> (not res!276629) (not e!269950))))

(declare-datatypes ((array!28809 0))(
  ( (array!28810 (arr!13838 (Array (_ BitVec 32) (_ BitVec 64))) (size!14190 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28809)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28809 (_ BitVec 32)) Bool)

(assert (=> b!462563 (= res!276629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462564 () Bool)

(assert (=> b!462564 (= e!269950 false)))

(declare-fun lt!209231 () Bool)

(declare-datatypes ((List!8346 0))(
  ( (Nil!8343) (Cons!8342 (h!9198 (_ BitVec 64)) (t!14290 List!8346)) )
))
(declare-fun arrayNoDuplicates!0 (array!28809 (_ BitVec 32) List!8346) Bool)

(assert (=> b!462564 (= lt!209231 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8343))))

(declare-fun b!462565 () Bool)

(declare-fun e!269949 () Bool)

(declare-fun tp_is_empty!12505 () Bool)

(assert (=> b!462565 (= e!269949 tp_is_empty!12505)))

(declare-fun mapIsEmpty!20428 () Bool)

(declare-fun mapRes!20428 () Bool)

(assert (=> mapIsEmpty!20428 mapRes!20428))

(declare-fun b!462566 () Bool)

(declare-fun e!269948 () Bool)

(assert (=> b!462566 (= e!269948 (and e!269949 mapRes!20428))))

(declare-fun condMapEmpty!20428 () Bool)

(declare-datatypes ((V!17779 0))(
  ( (V!17780 (val!6297 Int)) )
))
(declare-datatypes ((ValueCell!5909 0))(
  ( (ValueCellFull!5909 (v!8584 V!17779)) (EmptyCell!5909) )
))
(declare-datatypes ((array!28811 0))(
  ( (array!28812 (arr!13839 (Array (_ BitVec 32) ValueCell!5909)) (size!14191 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28811)

(declare-fun mapDefault!20428 () ValueCell!5909)

