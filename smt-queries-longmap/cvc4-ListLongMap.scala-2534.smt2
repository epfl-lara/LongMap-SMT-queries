; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39026 () Bool)

(assert start!39026)

(declare-fun res!236903 () Bool)

(declare-fun e!245513 () Bool)

(assert (=> start!39026 (=> (not res!236903) (not e!245513))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24763 0))(
  ( (array!24764 (arr!11831 (Array (_ BitVec 32) (_ BitVec 64))) (size!12183 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24763)

(assert (=> start!39026 (= res!236903 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12183 _keys!709))))))

(assert (=> start!39026 e!245513))

(assert (=> start!39026 true))

(declare-datatypes ((V!15031 0))(
  ( (V!15032 (val!5267 Int)) )
))
(declare-datatypes ((ValueCell!4879 0))(
  ( (ValueCellFull!4879 (v!7514 V!15031)) (EmptyCell!4879) )
))
(declare-datatypes ((array!24765 0))(
  ( (array!24766 (arr!11832 (Array (_ BitVec 32) ValueCell!4879)) (size!12184 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24765)

(declare-fun e!245510 () Bool)

(declare-fun array_inv!8634 (array!24765) Bool)

(assert (=> start!39026 (and (array_inv!8634 _values!549) e!245510)))

(declare-fun array_inv!8635 (array!24763) Bool)

(assert (=> start!39026 (array_inv!8635 _keys!709)))

(declare-fun b!409199 () Bool)

(declare-fun e!245511 () Bool)

(assert (=> b!409199 (= e!245511 false)))

(declare-fun lt!188914 () Bool)

(declare-fun lt!188915 () array!24763)

(declare-datatypes ((List!6848 0))(
  ( (Nil!6845) (Cons!6844 (h!7700 (_ BitVec 64)) (t!12022 List!6848)) )
))
(declare-fun arrayNoDuplicates!0 (array!24763 (_ BitVec 32) List!6848) Bool)

(assert (=> b!409199 (= lt!188914 (arrayNoDuplicates!0 lt!188915 #b00000000000000000000000000000000 Nil!6845))))

(declare-fun b!409200 () Bool)

(declare-fun res!236900 () Bool)

(assert (=> b!409200 (=> (not res!236900) (not e!245513))))

(assert (=> b!409200 (= res!236900 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6845))))

(declare-fun b!409201 () Bool)

(declare-fun res!236901 () Bool)

(assert (=> b!409201 (=> (not res!236901) (not e!245513))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409201 (= res!236901 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12183 _keys!709))))))

(declare-fun b!409202 () Bool)

(declare-fun res!236902 () Bool)

(assert (=> b!409202 (=> (not res!236902) (not e!245513))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409202 (= res!236902 (validMask!0 mask!1025))))

(declare-fun b!409203 () Bool)

(assert (=> b!409203 (= e!245513 e!245511)))

(declare-fun res!236904 () Bool)

(assert (=> b!409203 (=> (not res!236904) (not e!245511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24763 (_ BitVec 32)) Bool)

(assert (=> b!409203 (= res!236904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188915 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!409203 (= lt!188915 (array!24764 (store (arr!11831 _keys!709) i!563 k!794) (size!12183 _keys!709)))))

(declare-fun b!409204 () Bool)

(declare-fun e!245512 () Bool)

(declare-fun tp_is_empty!10445 () Bool)

(assert (=> b!409204 (= e!245512 tp_is_empty!10445)))

(declare-fun b!409205 () Bool)

(declare-fun res!236907 () Bool)

(assert (=> b!409205 (=> (not res!236907) (not e!245513))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!409205 (= res!236907 (and (= (size!12184 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12183 _keys!709) (size!12184 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409206 () Bool)

(declare-fun res!236905 () Bool)

(assert (=> b!409206 (=> (not res!236905) (not e!245513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409206 (= res!236905 (validKeyInArray!0 k!794))))

(declare-fun b!409207 () Bool)

(declare-fun e!245514 () Bool)

(declare-fun mapRes!17289 () Bool)

(assert (=> b!409207 (= e!245510 (and e!245514 mapRes!17289))))

(declare-fun condMapEmpty!17289 () Bool)

(declare-fun mapDefault!17289 () ValueCell!4879)

