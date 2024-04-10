; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40402 () Bool)

(assert start!40402)

(declare-fun b!444185 () Bool)

(declare-fun e!261255 () Bool)

(declare-fun e!261259 () Bool)

(assert (=> b!444185 (= e!261255 e!261259)))

(declare-fun res!263343 () Bool)

(assert (=> b!444185 (=> (not res!263343) (not e!261259))))

(declare-datatypes ((array!27383 0))(
  ( (array!27384 (arr!13139 (Array (_ BitVec 32) (_ BitVec 64))) (size!13491 (_ BitVec 32))) )
))
(declare-fun lt!203453 () array!27383)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27383 (_ BitVec 32)) Bool)

(assert (=> b!444185 (= res!263343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203453 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!27383)

(assert (=> b!444185 (= lt!203453 (array!27384 (store (arr!13139 _keys!709) i!563 k0!794) (size!13491 _keys!709)))))

(declare-fun mapNonEmpty!19308 () Bool)

(declare-fun mapRes!19308 () Bool)

(declare-fun tp!37290 () Bool)

(declare-fun e!261257 () Bool)

(assert (=> mapNonEmpty!19308 (= mapRes!19308 (and tp!37290 e!261257))))

(declare-fun mapKey!19308 () (_ BitVec 32))

(declare-datatypes ((V!16821 0))(
  ( (V!16822 (val!5938 Int)) )
))
(declare-datatypes ((ValueCell!5550 0))(
  ( (ValueCellFull!5550 (v!8189 V!16821)) (EmptyCell!5550) )
))
(declare-fun mapValue!19308 () ValueCell!5550)

(declare-fun mapRest!19308 () (Array (_ BitVec 32) ValueCell!5550))

(declare-datatypes ((array!27385 0))(
  ( (array!27386 (arr!13140 (Array (_ BitVec 32) ValueCell!5550)) (size!13492 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27385)

(assert (=> mapNonEmpty!19308 (= (arr!13140 _values!549) (store mapRest!19308 mapKey!19308 mapValue!19308))))

(declare-fun b!444186 () Bool)

(declare-fun res!263344 () Bool)

(assert (=> b!444186 (=> (not res!263344) (not e!261255))))

(declare-datatypes ((List!7869 0))(
  ( (Nil!7866) (Cons!7865 (h!8721 (_ BitVec 64)) (t!13627 List!7869)) )
))
(declare-fun arrayNoDuplicates!0 (array!27383 (_ BitVec 32) List!7869) Bool)

(assert (=> b!444186 (= res!263344 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7866))))

(declare-fun b!444187 () Bool)

(declare-fun tp_is_empty!11787 () Bool)

(assert (=> b!444187 (= e!261257 tp_is_empty!11787)))

(declare-fun b!444188 () Bool)

(declare-fun res!263350 () Bool)

(assert (=> b!444188 (=> (not res!263350) (not e!261255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444188 (= res!263350 (validMask!0 mask!1025))))

(declare-fun b!444189 () Bool)

(declare-fun res!263349 () Bool)

(assert (=> b!444189 (=> (not res!263349) (not e!261255))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444189 (= res!263349 (and (= (size!13492 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13491 _keys!709) (size!13492 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444190 () Bool)

(declare-fun e!261258 () Bool)

(assert (=> b!444190 (= e!261258 tp_is_empty!11787)))

(declare-fun res!263342 () Bool)

(assert (=> start!40402 (=> (not res!263342) (not e!261255))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40402 (= res!263342 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13491 _keys!709))))))

(assert (=> start!40402 e!261255))

(assert (=> start!40402 true))

(declare-fun e!261256 () Bool)

(declare-fun array_inv!9530 (array!27385) Bool)

(assert (=> start!40402 (and (array_inv!9530 _values!549) e!261256)))

(declare-fun array_inv!9531 (array!27383) Bool)

(assert (=> start!40402 (array_inv!9531 _keys!709)))

(declare-fun b!444191 () Bool)

(assert (=> b!444191 (= e!261256 (and e!261258 mapRes!19308))))

(declare-fun condMapEmpty!19308 () Bool)

(declare-fun mapDefault!19308 () ValueCell!5550)

(assert (=> b!444191 (= condMapEmpty!19308 (= (arr!13140 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5550)) mapDefault!19308)))))

(declare-fun b!444192 () Bool)

(declare-fun res!263346 () Bool)

(assert (=> b!444192 (=> (not res!263346) (not e!261255))))

(declare-fun arrayContainsKey!0 (array!27383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444192 (= res!263346 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444193 () Bool)

(declare-fun res!263345 () Bool)

(assert (=> b!444193 (=> (not res!263345) (not e!261255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444193 (= res!263345 (validKeyInArray!0 k0!794))))

(declare-fun b!444194 () Bool)

(assert (=> b!444194 (= e!261259 false)))

(declare-fun lt!203452 () Bool)

(assert (=> b!444194 (= lt!203452 (arrayNoDuplicates!0 lt!203453 #b00000000000000000000000000000000 Nil!7866))))

(declare-fun b!444195 () Bool)

(declare-fun res!263341 () Bool)

(assert (=> b!444195 (=> (not res!263341) (not e!261255))))

(assert (=> b!444195 (= res!263341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444196 () Bool)

(declare-fun res!263348 () Bool)

(assert (=> b!444196 (=> (not res!263348) (not e!261255))))

(assert (=> b!444196 (= res!263348 (or (= (select (arr!13139 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13139 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444197 () Bool)

(declare-fun res!263347 () Bool)

(assert (=> b!444197 (=> (not res!263347) (not e!261255))))

(assert (=> b!444197 (= res!263347 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13491 _keys!709))))))

(declare-fun mapIsEmpty!19308 () Bool)

(assert (=> mapIsEmpty!19308 mapRes!19308))

(assert (= (and start!40402 res!263342) b!444188))

(assert (= (and b!444188 res!263350) b!444189))

(assert (= (and b!444189 res!263349) b!444195))

(assert (= (and b!444195 res!263341) b!444186))

(assert (= (and b!444186 res!263344) b!444197))

(assert (= (and b!444197 res!263347) b!444193))

(assert (= (and b!444193 res!263345) b!444196))

(assert (= (and b!444196 res!263348) b!444192))

(assert (= (and b!444192 res!263346) b!444185))

(assert (= (and b!444185 res!263343) b!444194))

(assert (= (and b!444191 condMapEmpty!19308) mapIsEmpty!19308))

(assert (= (and b!444191 (not condMapEmpty!19308)) mapNonEmpty!19308))

(get-info :version)

(assert (= (and mapNonEmpty!19308 ((_ is ValueCellFull!5550) mapValue!19308)) b!444187))

(assert (= (and b!444191 ((_ is ValueCellFull!5550) mapDefault!19308)) b!444190))

(assert (= start!40402 b!444191))

(declare-fun m!430165 () Bool)

(assert (=> b!444194 m!430165))

(declare-fun m!430167 () Bool)

(assert (=> b!444193 m!430167))

(declare-fun m!430169 () Bool)

(assert (=> start!40402 m!430169))

(declare-fun m!430171 () Bool)

(assert (=> start!40402 m!430171))

(declare-fun m!430173 () Bool)

(assert (=> b!444188 m!430173))

(declare-fun m!430175 () Bool)

(assert (=> b!444186 m!430175))

(declare-fun m!430177 () Bool)

(assert (=> b!444195 m!430177))

(declare-fun m!430179 () Bool)

(assert (=> b!444196 m!430179))

(declare-fun m!430181 () Bool)

(assert (=> b!444192 m!430181))

(declare-fun m!430183 () Bool)

(assert (=> mapNonEmpty!19308 m!430183))

(declare-fun m!430185 () Bool)

(assert (=> b!444185 m!430185))

(declare-fun m!430187 () Bool)

(assert (=> b!444185 m!430187))

(check-sat (not b!444193) (not b!444194) (not mapNonEmpty!19308) (not start!40402) tp_is_empty!11787 (not b!444195) (not b!444186) (not b!444185) (not b!444188) (not b!444192))
(check-sat)
