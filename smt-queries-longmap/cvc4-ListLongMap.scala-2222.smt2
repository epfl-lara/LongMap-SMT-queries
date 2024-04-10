; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36798 () Bool)

(assert start!36798)

(declare-fun b!367578 () Bool)

(declare-fun res!205827 () Bool)

(declare-fun e!224938 () Bool)

(assert (=> b!367578 (=> (not res!205827) (not e!224938))))

(declare-datatypes ((array!21105 0))(
  ( (array!21106 (arr!10021 (Array (_ BitVec 32) (_ BitVec 64))) (size!10373 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21105)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367578 (= res!205827 (or (= (select (arr!10021 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10021 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367579 () Bool)

(declare-fun e!224935 () Bool)

(declare-fun tp_is_empty!8573 () Bool)

(assert (=> b!367579 (= e!224935 tp_is_empty!8573)))

(declare-fun b!367580 () Bool)

(declare-fun e!224934 () Bool)

(assert (=> b!367580 (= e!224934 tp_is_empty!8573)))

(declare-fun mapNonEmpty!14424 () Bool)

(declare-fun mapRes!14424 () Bool)

(declare-fun tp!28500 () Bool)

(assert (=> mapNonEmpty!14424 (= mapRes!14424 (and tp!28500 e!224934))))

(declare-datatypes ((V!12535 0))(
  ( (V!12536 (val!4331 Int)) )
))
(declare-datatypes ((ValueCell!3943 0))(
  ( (ValueCellFull!3943 (v!6528 V!12535)) (EmptyCell!3943) )
))
(declare-datatypes ((array!21107 0))(
  ( (array!21108 (arr!10022 (Array (_ BitVec 32) ValueCell!3943)) (size!10374 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21107)

(declare-fun mapValue!14424 () ValueCell!3943)

(declare-fun mapKey!14424 () (_ BitVec 32))

(declare-fun mapRest!14424 () (Array (_ BitVec 32) ValueCell!3943))

(assert (=> mapNonEmpty!14424 (= (arr!10022 _values!506) (store mapRest!14424 mapKey!14424 mapValue!14424))))

(declare-fun b!367581 () Bool)

(declare-fun res!205828 () Bool)

(assert (=> b!367581 (=> (not res!205828) (not e!224938))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21105 (_ BitVec 32)) Bool)

(assert (=> b!367581 (= res!205828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367582 () Bool)

(declare-fun e!224936 () Bool)

(assert (=> b!367582 (= e!224938 e!224936)))

(declare-fun res!205829 () Bool)

(assert (=> b!367582 (=> (not res!205829) (not e!224936))))

(declare-fun lt!169406 () array!21105)

(assert (=> b!367582 (= res!205829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169406 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!367582 (= lt!169406 (array!21106 (store (arr!10021 _keys!658) i!548 k!778) (size!10373 _keys!658)))))

(declare-fun b!367583 () Bool)

(declare-fun res!205826 () Bool)

(assert (=> b!367583 (=> (not res!205826) (not e!224938))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367583 (= res!205826 (and (= (size!10374 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10373 _keys!658) (size!10374 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14424 () Bool)

(assert (=> mapIsEmpty!14424 mapRes!14424))

(declare-fun b!367584 () Bool)

(declare-fun res!205824 () Bool)

(assert (=> b!367584 (=> (not res!205824) (not e!224938))))

(assert (=> b!367584 (= res!205824 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10373 _keys!658))))))

(declare-fun res!205822 () Bool)

(assert (=> start!36798 (=> (not res!205822) (not e!224938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36798 (= res!205822 (validMask!0 mask!970))))

(assert (=> start!36798 e!224938))

(assert (=> start!36798 true))

(declare-fun e!224937 () Bool)

(declare-fun array_inv!7410 (array!21107) Bool)

(assert (=> start!36798 (and (array_inv!7410 _values!506) e!224937)))

(declare-fun array_inv!7411 (array!21105) Bool)

(assert (=> start!36798 (array_inv!7411 _keys!658)))

(declare-fun b!367585 () Bool)

(assert (=> b!367585 (= e!224937 (and e!224935 mapRes!14424))))

(declare-fun condMapEmpty!14424 () Bool)

(declare-fun mapDefault!14424 () ValueCell!3943)

