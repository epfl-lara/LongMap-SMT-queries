; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39010 () Bool)

(assert start!39010)

(declare-fun b!408887 () Bool)

(declare-fun res!236661 () Bool)

(declare-fun e!245366 () Bool)

(assert (=> b!408887 (=> (not res!236661) (not e!245366))))

(declare-datatypes ((array!24731 0))(
  ( (array!24732 (arr!11815 (Array (_ BitVec 32) (_ BitVec 64))) (size!12167 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24731)

(declare-datatypes ((List!6842 0))(
  ( (Nil!6839) (Cons!6838 (h!7694 (_ BitVec 64)) (t!12016 List!6842)) )
))
(declare-fun arrayNoDuplicates!0 (array!24731 (_ BitVec 32) List!6842) Bool)

(assert (=> b!408887 (= res!236661 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6839))))

(declare-fun b!408888 () Bool)

(declare-fun e!245370 () Bool)

(declare-fun tp_is_empty!10429 () Bool)

(assert (=> b!408888 (= e!245370 tp_is_empty!10429)))

(declare-fun b!408889 () Bool)

(declare-fun res!236665 () Bool)

(assert (=> b!408889 (=> (not res!236665) (not e!245366))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408889 (= res!236665 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!408890 () Bool)

(declare-fun res!236662 () Bool)

(assert (=> b!408890 (=> (not res!236662) (not e!245366))))

(declare-datatypes ((V!15011 0))(
  ( (V!15012 (val!5259 Int)) )
))
(declare-datatypes ((ValueCell!4871 0))(
  ( (ValueCellFull!4871 (v!7506 V!15011)) (EmptyCell!4871) )
))
(declare-datatypes ((array!24733 0))(
  ( (array!24734 (arr!11816 (Array (_ BitVec 32) ValueCell!4871)) (size!12168 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24733)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408890 (= res!236662 (and (= (size!12168 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12167 _keys!709) (size!12168 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408891 () Bool)

(declare-fun e!245365 () Bool)

(assert (=> b!408891 (= e!245365 tp_is_empty!10429)))

(declare-fun res!236664 () Bool)

(assert (=> start!39010 (=> (not res!236664) (not e!245366))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39010 (= res!236664 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12167 _keys!709))))))

(assert (=> start!39010 e!245366))

(assert (=> start!39010 true))

(declare-fun e!245367 () Bool)

(declare-fun array_inv!8620 (array!24733) Bool)

(assert (=> start!39010 (and (array_inv!8620 _values!549) e!245367)))

(declare-fun array_inv!8621 (array!24731) Bool)

(assert (=> start!39010 (array_inv!8621 _keys!709)))

(declare-fun b!408892 () Bool)

(declare-fun res!236659 () Bool)

(assert (=> b!408892 (=> (not res!236659) (not e!245366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408892 (= res!236659 (validKeyInArray!0 k!794))))

(declare-fun b!408893 () Bool)

(declare-fun mapRes!17265 () Bool)

(assert (=> b!408893 (= e!245367 (and e!245370 mapRes!17265))))

(declare-fun condMapEmpty!17265 () Bool)

(declare-fun mapDefault!17265 () ValueCell!4871)

