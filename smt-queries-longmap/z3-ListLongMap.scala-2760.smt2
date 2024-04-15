; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40398 () Bool)

(assert start!40398)

(declare-fun b!444109 () Bool)

(declare-fun res!263371 () Bool)

(declare-fun e!261171 () Bool)

(assert (=> b!444109 (=> (not res!263371) (not e!261171))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27407 0))(
  ( (array!27408 (arr!13151 (Array (_ BitVec 32) (_ BitVec 64))) (size!13504 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27407)

(assert (=> b!444109 (= res!263371 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13504 _keys!709))))))

(declare-fun b!444110 () Bool)

(declare-fun res!263362 () Bool)

(assert (=> b!444110 (=> (not res!263362) (not e!261171))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27407 (_ BitVec 32)) Bool)

(assert (=> b!444110 (= res!263362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444111 () Bool)

(declare-fun res!263370 () Bool)

(assert (=> b!444111 (=> (not res!263370) (not e!261171))))

(declare-datatypes ((List!7875 0))(
  ( (Nil!7872) (Cons!7871 (h!8727 (_ BitVec 64)) (t!13624 List!7875)) )
))
(declare-fun arrayNoDuplicates!0 (array!27407 (_ BitVec 32) List!7875) Bool)

(assert (=> b!444111 (= res!263370 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7872))))

(declare-fun mapNonEmpty!19323 () Bool)

(declare-fun mapRes!19323 () Bool)

(declare-fun tp!37305 () Bool)

(declare-fun e!261172 () Bool)

(assert (=> mapNonEmpty!19323 (= mapRes!19323 (and tp!37305 e!261172))))

(declare-datatypes ((V!16835 0))(
  ( (V!16836 (val!5943 Int)) )
))
(declare-datatypes ((ValueCell!5555 0))(
  ( (ValueCellFull!5555 (v!8188 V!16835)) (EmptyCell!5555) )
))
(declare-fun mapRest!19323 () (Array (_ BitVec 32) ValueCell!5555))

(declare-fun mapKey!19323 () (_ BitVec 32))

(declare-datatypes ((array!27409 0))(
  ( (array!27410 (arr!13152 (Array (_ BitVec 32) ValueCell!5555)) (size!13505 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27409)

(declare-fun mapValue!19323 () ValueCell!5555)

(assert (=> mapNonEmpty!19323 (= (arr!13152 _values!549) (store mapRest!19323 mapKey!19323 mapValue!19323))))

(declare-fun b!444112 () Bool)

(declare-fun e!261176 () Bool)

(declare-fun e!261173 () Bool)

(assert (=> b!444112 (= e!261176 (and e!261173 mapRes!19323))))

(declare-fun condMapEmpty!19323 () Bool)

(declare-fun mapDefault!19323 () ValueCell!5555)

(assert (=> b!444112 (= condMapEmpty!19323 (= (arr!13152 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5555)) mapDefault!19323)))))

(declare-fun b!444113 () Bool)

(declare-fun e!261175 () Bool)

(assert (=> b!444113 (= e!261175 false)))

(declare-fun lt!203249 () Bool)

(declare-fun lt!203248 () array!27407)

(assert (=> b!444113 (= lt!203249 (arrayNoDuplicates!0 lt!203248 #b00000000000000000000000000000000 Nil!7872))))

(declare-fun b!444114 () Bool)

(declare-fun res!263367 () Bool)

(assert (=> b!444114 (=> (not res!263367) (not e!261171))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444114 (= res!263367 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444115 () Bool)

(declare-fun res!263368 () Bool)

(assert (=> b!444115 (=> (not res!263368) (not e!261171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444115 (= res!263368 (validKeyInArray!0 k0!794))))

(declare-fun b!444116 () Bool)

(declare-fun tp_is_empty!11797 () Bool)

(assert (=> b!444116 (= e!261172 tp_is_empty!11797)))

(declare-fun b!444117 () Bool)

(declare-fun res!263363 () Bool)

(assert (=> b!444117 (=> (not res!263363) (not e!261171))))

(assert (=> b!444117 (= res!263363 (or (= (select (arr!13151 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13151 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444118 () Bool)

(assert (=> b!444118 (= e!261173 tp_is_empty!11797)))

(declare-fun res!263366 () Bool)

(assert (=> start!40398 (=> (not res!263366) (not e!261171))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40398 (= res!263366 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13504 _keys!709))))))

(assert (=> start!40398 e!261171))

(assert (=> start!40398 true))

(declare-fun array_inv!9590 (array!27409) Bool)

(assert (=> start!40398 (and (array_inv!9590 _values!549) e!261176)))

(declare-fun array_inv!9591 (array!27407) Bool)

(assert (=> start!40398 (array_inv!9591 _keys!709)))

(declare-fun mapIsEmpty!19323 () Bool)

(assert (=> mapIsEmpty!19323 mapRes!19323))

(declare-fun b!444119 () Bool)

(declare-fun res!263365 () Bool)

(assert (=> b!444119 (=> (not res!263365) (not e!261171))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444119 (= res!263365 (and (= (size!13505 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13504 _keys!709) (size!13505 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444120 () Bool)

(assert (=> b!444120 (= e!261171 e!261175)))

(declare-fun res!263364 () Bool)

(assert (=> b!444120 (=> (not res!263364) (not e!261175))))

(assert (=> b!444120 (= res!263364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203248 mask!1025))))

(assert (=> b!444120 (= lt!203248 (array!27408 (store (arr!13151 _keys!709) i!563 k0!794) (size!13504 _keys!709)))))

(declare-fun b!444121 () Bool)

(declare-fun res!263369 () Bool)

(assert (=> b!444121 (=> (not res!263369) (not e!261171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444121 (= res!263369 (validMask!0 mask!1025))))

(assert (= (and start!40398 res!263366) b!444121))

(assert (= (and b!444121 res!263369) b!444119))

(assert (= (and b!444119 res!263365) b!444110))

(assert (= (and b!444110 res!263362) b!444111))

(assert (= (and b!444111 res!263370) b!444109))

(assert (= (and b!444109 res!263371) b!444115))

(assert (= (and b!444115 res!263368) b!444117))

(assert (= (and b!444117 res!263363) b!444114))

(assert (= (and b!444114 res!263367) b!444120))

(assert (= (and b!444120 res!263364) b!444113))

(assert (= (and b!444112 condMapEmpty!19323) mapIsEmpty!19323))

(assert (= (and b!444112 (not condMapEmpty!19323)) mapNonEmpty!19323))

(get-info :version)

(assert (= (and mapNonEmpty!19323 ((_ is ValueCellFull!5555) mapValue!19323)) b!444116))

(assert (= (and b!444112 ((_ is ValueCellFull!5555) mapDefault!19323)) b!444118))

(assert (= start!40398 b!444112))

(declare-fun m!429553 () Bool)

(assert (=> b!444114 m!429553))

(declare-fun m!429555 () Bool)

(assert (=> b!444117 m!429555))

(declare-fun m!429557 () Bool)

(assert (=> b!444113 m!429557))

(declare-fun m!429559 () Bool)

(assert (=> b!444120 m!429559))

(declare-fun m!429561 () Bool)

(assert (=> b!444120 m!429561))

(declare-fun m!429563 () Bool)

(assert (=> b!444110 m!429563))

(declare-fun m!429565 () Bool)

(assert (=> b!444115 m!429565))

(declare-fun m!429567 () Bool)

(assert (=> b!444121 m!429567))

(declare-fun m!429569 () Bool)

(assert (=> b!444111 m!429569))

(declare-fun m!429571 () Bool)

(assert (=> mapNonEmpty!19323 m!429571))

(declare-fun m!429573 () Bool)

(assert (=> start!40398 m!429573))

(declare-fun m!429575 () Bool)

(assert (=> start!40398 m!429575))

(check-sat (not mapNonEmpty!19323) (not b!444114) (not b!444111) (not b!444110) (not b!444113) (not start!40398) (not b!444120) (not b!444115) (not b!444121) tp_is_empty!11797)
(check-sat)
