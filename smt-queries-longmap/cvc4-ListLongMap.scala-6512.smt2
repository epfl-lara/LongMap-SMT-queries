; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82916 () Bool)

(assert start!82916)

(declare-fun b_free!19043 () Bool)

(declare-fun b_next!19043 () Bool)

(assert (=> start!82916 (= b_free!19043 (not b_next!19043))))

(declare-fun tp!66258 () Bool)

(declare-fun b_and!30531 () Bool)

(assert (=> start!82916 (= tp!66258 b_and!30531)))

(declare-fun b!967548 () Bool)

(declare-fun res!647698 () Bool)

(declare-fun e!545332 () Bool)

(assert (=> b!967548 (=> (not res!647698) (not e!545332))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34117 0))(
  ( (V!34118 (val!10976 Int)) )
))
(declare-datatypes ((ValueCell!10444 0))(
  ( (ValueCellFull!10444 (v!13534 V!34117)) (EmptyCell!10444) )
))
(declare-datatypes ((array!59775 0))(
  ( (array!59776 (arr!28756 (Array (_ BitVec 32) ValueCell!10444)) (size!29235 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59775)

(declare-datatypes ((array!59777 0))(
  ( (array!59778 (arr!28757 (Array (_ BitVec 32) (_ BitVec 64))) (size!29236 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59777)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!967548 (= res!647698 (and (= (size!29235 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29236 _keys!1686) (size!29235 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34771 () Bool)

(declare-fun mapRes!34771 () Bool)

(declare-fun tp!66257 () Bool)

(declare-fun e!545334 () Bool)

(assert (=> mapNonEmpty!34771 (= mapRes!34771 (and tp!66257 e!545334))))

(declare-fun mapKey!34771 () (_ BitVec 32))

(declare-fun mapValue!34771 () ValueCell!10444)

(declare-fun mapRest!34771 () (Array (_ BitVec 32) ValueCell!10444))

(assert (=> mapNonEmpty!34771 (= (arr!28756 _values!1400) (store mapRest!34771 mapKey!34771 mapValue!34771))))

(declare-fun b!967549 () Bool)

(declare-fun res!647696 () Bool)

(assert (=> b!967549 (=> (not res!647696) (not e!545332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59777 (_ BitVec 32)) Bool)

(assert (=> b!967549 (= res!647696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967550 () Bool)

(declare-fun e!545333 () Bool)

(declare-fun e!545335 () Bool)

(assert (=> b!967550 (= e!545333 (and e!545335 mapRes!34771))))

(declare-fun condMapEmpty!34771 () Bool)

(declare-fun mapDefault!34771 () ValueCell!10444)

