; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38440 () Bool)

(assert start!38440)

(declare-fun b!396476 () Bool)

(declare-fun e!239914 () Bool)

(declare-fun e!239913 () Bool)

(assert (=> b!396476 (= e!239914 e!239913)))

(declare-fun res!227469 () Bool)

(assert (=> b!396476 (=> (not res!227469) (not e!239913))))

(declare-datatypes ((array!23631 0))(
  ( (array!23632 (arr!11265 (Array (_ BitVec 32) (_ BitVec 64))) (size!11617 (_ BitVec 32))) )
))
(declare-fun lt!187156 () array!23631)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23631 (_ BitVec 32)) Bool)

(assert (=> b!396476 (= res!227469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187156 mask!1025))))

(declare-fun _keys!709 () array!23631)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396476 (= lt!187156 (array!23632 (store (arr!11265 _keys!709) i!563 k!794) (size!11617 _keys!709)))))

(declare-fun b!396477 () Bool)

(assert (=> b!396477 (= e!239913 false)))

(declare-fun lt!187157 () Bool)

(declare-datatypes ((List!6527 0))(
  ( (Nil!6524) (Cons!6523 (h!7379 (_ BitVec 64)) (t!11701 List!6527)) )
))
(declare-fun arrayNoDuplicates!0 (array!23631 (_ BitVec 32) List!6527) Bool)

(assert (=> b!396477 (= lt!187157 (arrayNoDuplicates!0 lt!187156 #b00000000000000000000000000000000 Nil!6524))))

(declare-fun b!396478 () Bool)

(declare-fun res!227461 () Bool)

(assert (=> b!396478 (=> (not res!227461) (not e!239914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396478 (= res!227461 (validKeyInArray!0 k!794))))

(declare-fun b!396479 () Bool)

(declare-fun res!227468 () Bool)

(assert (=> b!396479 (=> (not res!227468) (not e!239914))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14251 0))(
  ( (V!14252 (val!4974 Int)) )
))
(declare-datatypes ((ValueCell!4586 0))(
  ( (ValueCellFull!4586 (v!7221 V!14251)) (EmptyCell!4586) )
))
(declare-datatypes ((array!23633 0))(
  ( (array!23634 (arr!11266 (Array (_ BitVec 32) ValueCell!4586)) (size!11618 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23633)

(assert (=> b!396479 (= res!227468 (and (= (size!11618 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11617 _keys!709) (size!11618 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396480 () Bool)

(declare-fun e!239911 () Bool)

(declare-fun tp_is_empty!9859 () Bool)

(assert (=> b!396480 (= e!239911 tp_is_empty!9859)))

(declare-fun b!396481 () Bool)

(declare-fun e!239915 () Bool)

(declare-fun mapRes!16410 () Bool)

(assert (=> b!396481 (= e!239915 (and e!239911 mapRes!16410))))

(declare-fun condMapEmpty!16410 () Bool)

(declare-fun mapDefault!16410 () ValueCell!4586)

