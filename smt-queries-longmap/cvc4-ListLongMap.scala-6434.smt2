; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82404 () Bool)

(assert start!82404)

(declare-fun b_free!18671 () Bool)

(declare-fun b_next!18671 () Bool)

(assert (=> start!82404 (= b_free!18671 (not b_next!18671))))

(declare-fun tp!64982 () Bool)

(declare-fun b_and!30159 () Bool)

(assert (=> start!82404 (= tp!64982 b_and!30159)))

(declare-fun b!960898 () Bool)

(declare-fun res!643216 () Bool)

(declare-fun e!541650 () Bool)

(assert (=> b!960898 (=> (not res!643216) (not e!541650))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58855 0))(
  ( (array!58856 (arr!28301 (Array (_ BitVec 32) (_ BitVec 64))) (size!28780 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58855)

(declare-datatypes ((V!33493 0))(
  ( (V!33494 (val!10742 Int)) )
))
(declare-datatypes ((ValueCell!10210 0))(
  ( (ValueCellFull!10210 (v!13299 V!33493)) (EmptyCell!10210) )
))
(declare-datatypes ((array!58857 0))(
  ( (array!58858 (arr!28302 (Array (_ BitVec 32) ValueCell!10210)) (size!28781 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58857)

(assert (=> b!960898 (= res!643216 (and (= (size!28781 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28780 _keys!1668) (size!28781 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960899 () Bool)

(declare-fun res!643214 () Bool)

(assert (=> b!960899 (=> (not res!643214) (not e!541650))))

(declare-datatypes ((List!19681 0))(
  ( (Nil!19678) (Cons!19677 (h!20839 (_ BitVec 64)) (t!28044 List!19681)) )
))
(declare-fun arrayNoDuplicates!0 (array!58855 (_ BitVec 32) List!19681) Bool)

(assert (=> b!960899 (= res!643214 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19678))))

(declare-fun b!960900 () Bool)

(declare-fun res!643212 () Bool)

(assert (=> b!960900 (=> (not res!643212) (not e!541650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58855 (_ BitVec 32)) Bool)

(assert (=> b!960900 (= res!643212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!643215 () Bool)

(assert (=> start!82404 (=> (not res!643215) (not e!541650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82404 (= res!643215 (validMask!0 mask!2088))))

(assert (=> start!82404 e!541650))

(assert (=> start!82404 true))

(declare-fun tp_is_empty!21383 () Bool)

(assert (=> start!82404 tp_is_empty!21383))

(declare-fun array_inv!21927 (array!58855) Bool)

(assert (=> start!82404 (array_inv!21927 _keys!1668)))

(declare-fun e!541646 () Bool)

(declare-fun array_inv!21928 (array!58857) Bool)

(assert (=> start!82404 (and (array_inv!21928 _values!1386) e!541646)))

(assert (=> start!82404 tp!64982))

(declare-fun b!960901 () Bool)

(declare-fun e!541649 () Bool)

(declare-fun mapRes!34054 () Bool)

(assert (=> b!960901 (= e!541646 (and e!541649 mapRes!34054))))

(declare-fun condMapEmpty!34054 () Bool)

(declare-fun mapDefault!34054 () ValueCell!10210)

