; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37656 () Bool)

(assert start!37656)

(declare-fun res!219912 () Bool)

(declare-fun e!234011 () Bool)

(assert (=> start!37656 (=> (not res!219912) (not e!234011))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37656 (= res!219912 (validMask!0 mask!970))))

(assert (=> start!37656 e!234011))

(assert (=> start!37656 true))

(declare-datatypes ((V!13679 0))(
  ( (V!13680 (val!4760 Int)) )
))
(declare-datatypes ((ValueCell!4372 0))(
  ( (ValueCellFull!4372 (v!6957 V!13679)) (EmptyCell!4372) )
))
(declare-datatypes ((array!22761 0))(
  ( (array!22762 (arr!10849 (Array (_ BitVec 32) ValueCell!4372)) (size!11201 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22761)

(declare-fun e!234010 () Bool)

(declare-fun array_inv!7986 (array!22761) Bool)

(assert (=> start!37656 (and (array_inv!7986 _values!506) e!234010)))

(declare-datatypes ((array!22763 0))(
  ( (array!22764 (arr!10850 (Array (_ BitVec 32) (_ BitVec 64))) (size!11202 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22763)

(declare-fun array_inv!7987 (array!22763) Bool)

(assert (=> start!37656 (array_inv!7987 _keys!658)))

(declare-fun b!385530 () Bool)

(declare-fun res!219914 () Bool)

(assert (=> b!385530 (=> (not res!219914) (not e!234011))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385530 (= res!219914 (and (= (size!11201 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11202 _keys!658) (size!11201 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385531 () Bool)

(assert (=> b!385531 (= e!234011 false)))

(declare-fun lt!181629 () Bool)

(declare-datatypes ((List!6246 0))(
  ( (Nil!6243) (Cons!6242 (h!7098 (_ BitVec 64)) (t!11396 List!6246)) )
))
(declare-fun arrayNoDuplicates!0 (array!22763 (_ BitVec 32) List!6246) Bool)

(assert (=> b!385531 (= lt!181629 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6243))))

(declare-fun mapNonEmpty!15711 () Bool)

(declare-fun mapRes!15711 () Bool)

(declare-fun tp!31038 () Bool)

(declare-fun e!234008 () Bool)

(assert (=> mapNonEmpty!15711 (= mapRes!15711 (and tp!31038 e!234008))))

(declare-fun mapKey!15711 () (_ BitVec 32))

(declare-fun mapRest!15711 () (Array (_ BitVec 32) ValueCell!4372))

(declare-fun mapValue!15711 () ValueCell!4372)

(assert (=> mapNonEmpty!15711 (= (arr!10849 _values!506) (store mapRest!15711 mapKey!15711 mapValue!15711))))

(declare-fun b!385532 () Bool)

(declare-fun res!219913 () Bool)

(assert (=> b!385532 (=> (not res!219913) (not e!234011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22763 (_ BitVec 32)) Bool)

(assert (=> b!385532 (= res!219913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385533 () Bool)

(declare-fun e!234007 () Bool)

(declare-fun tp_is_empty!9431 () Bool)

(assert (=> b!385533 (= e!234007 tp_is_empty!9431)))

(declare-fun b!385534 () Bool)

(assert (=> b!385534 (= e!234010 (and e!234007 mapRes!15711))))

(declare-fun condMapEmpty!15711 () Bool)

(declare-fun mapDefault!15711 () ValueCell!4372)

